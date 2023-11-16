#!/usr/bin/env ruby

require 'uri'

DATE_AND_USER_REGEX = /
    ^
    \[([\-0-9\: ]+)\] # miasma of digits and separators
    \s*
    <([^>]+)> # nick
    /ix

DISCORD_MEDIA_URL_REGEX = /https?:\/\/
    (media|cdn).
    discord(\w*).
    (com|net)\/
    /ix

File.open(ARGV[0], "r") do |f|
    f.seek(0, IO::SEEK_END)
    file_len = f.pos
    f.rewind

    f.each_line do |line|
        next unless line.match?(DISCORD_MEDIA_URL_REGEX)
        $stderr.printf "% 9d / % 9d\r", f.pos, file_len

        date_user_match = DATE_AND_USER_REGEX.match(line)
        next unless date_user_match

        time_splits = date_user_match[1].split(/[^\d]/)
        timestamp = Time.local(*time_splits)

        user = date_user_match[2]

        urls = URI.extract(line, ['http', 'https'])
        urls.each.with_index do |u, i|
            uri = URI.parse(u)
            next unless uri.host.include? 'discord'

            last_path = uri.path.split('/').last

            dest = "#{timestamp.to_i}_#{user}_#{last_path}"
            puts "wget --no-clobber --output-document #{dest} #{uri.to_s}"
        end
    rescue => e
        $stderr.puts line
        raise
    end
end

$stderr.puts
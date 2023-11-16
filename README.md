# discord image scraper for irccloud

discord is doing a thing where image urls get a bunch of expiration
crap jammed on to the end,
i think in preparation for making the urls expire outside
of their client

this script will scrape the urls from irccloud logs
and put them into a file you can use with
`wget` to try to download them all before they break

i wrote and used this in about an hour,
no warranty,
read the source

## usage

1. Download your logs from irccloud.
2. Unzip them
3. Run the script on the log file, 
   and redirect it to a script you'll run:
   `ruby ../scraper.rb \#CHANNEL_NAME.txt > CHANNEL_NAME.sh`
4. Run the script it generates where you want your files
   `sh CHANNEL_NAME.sh`

## license

wtfpl 2.0 (see `LICENSE`)

## contact

i'm on fediverse <https://m.bonzoesc.net/@bonzoesc>

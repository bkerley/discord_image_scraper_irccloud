# discord image scraper for irccloud

discord is doing a thing where image urls get a bunch of expiration
crap jammed on to the end,
i think in preparation for making the urls expire outside
of their client

this script will scrape the urls from irccloud logs
and put them into a file you can use with
`wget` to try to download them all before they die
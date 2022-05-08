#!/bin/bash

if [ -z "$1" ]
    then
        echo
        echo "Usage: blacklist.sh <filename>"
        echo
        echo "Example: ./blacklist.sh spammer_userids-220508.csv"
        echo
        exit
fi

SPAMMER_USERIDS="$1"
DISQUS_FORUM_SHORTNAME="put your Disqus forum's shortname here"
DISQUS_API_KEY="put your public Disqus API key here"
DISQUS_ACCESS_TOKEN="put your Disqus API access token here"

i=1
count=1
users=""

echo
echo "Blacklisting of spammers started, please wait... (will take ~2 minutes)"
echo

while IFS= read -r line
do
    users="${users}&user[]=${line}"
    if [ "$i" -eq "100" ]
    then
        echo -n "- adding next ${i} spammers to the blacklist... "
        res=`curl -s -X POST -d "forum=${DISQUS_FORUM_SHORTNAME}&access_token=${DISQUS_ACCESS_TOKEN}&api_key=${DISQUS_API_KEY}${users}" "https://disqus.com/api/3.0/blacklists/add.json"`
        echo "done, waiting for 2s"
        sleep 2
        i=1;
        users=""
    else
        ((i=i+1))
    fi
    ((count=count+1))
done < "$SPAMMER_USERIDS"

echo
echo "All finished. Total spammers added to blacklist: ${count}"
echo
echo "Bye!"
echo

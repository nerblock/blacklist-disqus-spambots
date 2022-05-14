# Update 22.05.14:

**Disqus removed all userids listed in the csv files. The repo is now obsolete.**

# Mass blacklist disqus spambots

This script is for mass banning the upvoting spambots from a specified Disqus forum.

You need a linux terminal running `bash` to execute this script. Also make sure `curl` is installed.

Usage:

1. download the files to a directory
2. modify `blacklist.sh` in the following places:
   ```
   DISQUS_FORUM_SHORTNAME="put your Disqus forum's shortname here"
   DISQUS_API_KEY="put your public Disqus API key here"
   DISQUS_ACCESS_TOKEN="put your Disqus API access token here"
   ```

3. Run the script:
   ```
   ./blacklist.sh <filename>
   ```
- Example:
  ```
  ./blacklist.sh spammer_userids-220508.csv
  ```

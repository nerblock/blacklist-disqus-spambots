# Mass blacklist disqus spambots

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

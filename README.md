# BugMeNotNot

A simple script to export logins to your site people have posted on bugmenot.com, to help with automatically disabling or removing these rogue accounts from your system.

## How to use

Download bugmenotnot.rb, or clone the repository. Run:

```sh
ruby bugmenotnot.rb <your site domain> [optional output filename]
```

If you do not specify a filename, the output is saved as `<site domain>-bugmenotnot.json`, in the directory you've run the script.

## Dependencies

BugMeNotNot requires nokogiri (for HTML parsing and querying), openurl, and json. You can install these with the following:

```sh
$ gem install nokogiri
$ gem install openurl
$ gem install json
```


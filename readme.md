# Migbin
## To get started, run the following
```
mkdir ~/migration 2>/dev/null
cd ~/migration
git clone https://github.com/coolcourd/migbin.git
source ~/migration/migbin/bashrc
```

### commands
---
#### exportdbs
prompts you for the cpanel password and then exports all databases placing them in ~/migration/dbs
run without args to export all dbs after cpanel password prompt

##### flags
1. --prompt prompts you for a list of databases to export 
2. -p lets you provide the cpanel password
3. -h displays this help
#### findwpandimport
Runs a find for wordpress sites in public_html and imports the matching sql file from ~/migration/dbs.

(only runs if there is only one sql file that contains the full database name as read from each wp-config.php file.)
#### fixall
Runs both fixfiles and fixdirs
#### fixallwps
Runs a find and replace in public_html and uses fixwps on all wordpress installs
#### fixdirs
Runs from current directory and recursivly sets all directories to 755.
#### fixfiles
Runs from current directory and recursivly sets all files to 644.
#### fixwpbs
Runs a set of common wordpress fixes in your current directory.
#### getmysites
Builds an outline of all wordpress sites on the account and saves to ~/migration/migstuff/mysites.txt
#### httpit
Sets WordPress site in current working directory to us http:// protocol for the home and siteurl options.
#### httpsit
Sets WordPress site in current working directory to us https:// protocol for the home and siteurl options.
#### mailprep
Prompts you for a list of imap lines and creates email accounts for you. Does not play nicely with some passwords.
#### mailsync
Syncs over mail and etc directory from the server setup with the setupssh command
#### migrun
runs a command on the server setup with the setupssh command

example: 
* migrun ls migrationdbs
#### migsync
rsyncs from the source server with first argument to the logged in server as the second argument.
examples: 
* migsync public_html/ ~/migration/files
* migsync etc/example.com ~/etc
You can brace expand to grab multiple directoried from a source if you wrap the first argument in singlequotes.
example: 
* migsync '{etc,mail,public_html,migrationdbs}' ~/migration
#### mkcd
Takes in a list of directories to make and cds you to the last one. This uses mkdir -p.
#### setupssh
This is a core function to how many others run. This function prompts you to give it a login string for a source server and will prompt you for the password. It will setup an ssh key and copy it to the source server so you can easily communicate with the source server with commands like mailsync, migrun and migsync.
#### updatemigbin 
Uses git pull to update all scripts to the current version on github
#### wp
This is wpcli use with --help to see help for every command
#### wpdbimport
Imports an sql file, as the argument, and sets up a wp-config.php file for it if there is already a wp-config file in the current directory.
#### wpurl
Lets you read and/or set the home and/or siteurl option for the wordpress site in the current directory.

Run without flags to only read the values.
##### flags
1. -n Sets both to provided argument.
2. -h Sets home to provided argument.
3. -s Sets siteurl to provided argument.
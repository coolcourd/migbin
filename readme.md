# Migbin
## To get started, run the following
```
if [ -d ~/bin/migbin ]; then
    ~/bin/migbin/updatemigbin
else
    mkdir ~/bin 2>/dev/null
    cd ~/bin
    git clone https://github.com/coolcourd/migbin.git
    cd -
fi
source ~/bin/migbin/bashrc
```

### commands
---
#### createpsbu
Makes a backup of the wordpress site called psbu.tar
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
Runs a find in public_html and uses fixwps on all wordpress installs
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
#### importpsbu
Imports a psbu db and all.
#### mailprep
Prompts you for a list of imap lines and creates email accounts for you. Does not play nicely with some passwords.

Imap lines look like this:
source-imap-mailserver source-email-address source-password destination-imap-mailserver destination-email-address destination-password
#### mailsync
syncs etc and mail. can be used to sync an individual domain.
example: 
* mailsync # syncs all mail
* mailsync example.com # syncs only mail for example.com
#### phpver
gives you a list of ea-php versions installed on the server and lets you pick one
#### matchdbimport
imports the matching sql file from ~/migration/dbs.
#### mig
Creates two directories, ~/migration/files and ~/migration/dbs. This is used to store migration backups on a server.
#### miginstall
installs migbin on the source in the home directory.
#### migratewp 
Takes the path to a wordpress site on the source and the path to install it to one the destination.
#### migrun
runs a command on the server setup with the setupssh command

example: 
* migrun ls migrationdbs
#### migssh
Logs in to the source server
#### migsync
rsyncs from the source server with first argument to the logged in server as the second argument.
examples: 
* migsync public_html/ ~/migration/files
* migsync etc/example.com ~/etc
You can brace expand to grab multiple directoried from a source if you wrap the first argument in singlequotes.
example: 
* migsync '{etc,mail,public_html,migrationdbs}' ~/migration
#### mkcd _bashrc function_
Takes in a list of directories to make and cds you to the last one. This uses mkdir -p.
#### premig
Moves wordpress files and directories out of the current directory and into ~/premig$(date)
#### setupssh
This is a core function to how many others run. This function prompts you to give it a login string for a source server and will prompt you for the password. It will setup an ssh key and copy it to the source server so you can easily communicate with the source server with commands like mailsync, migrun and migsync.
#### showphp
checks the cgi php version running in the current directory.
#### syncdbs
migsyncs migraiondbs to ~/migration/dbs
#### tempurl
Displays the bluehost temporaryurl for the current directory.
#### tempurl
Sets the wordpress home and siteurl settings to the bluehost temporaryurl for the current directory.
#### updatemigbin 
Uses git pull to update all scripts to the current version on github
#### whodig 
displays dns settings for the domain you provide as the argument.
#### wp
This is wpcli use with --help to see help for every command
#### wpdbimport
Imports an sql file, as the argument, and sets up a wp-config.php file for it if there is already a wp-config file in the current directory.
#### wpht
corrects rewrite rules in the .htaccess
#### wpinfo
Displays info about te wordpress site in the current dir.
#### wplive
configures a wordpress site from the backup directory to it's live directory
example:
* wplive ~/migration/files/ ~/public_html
#### wpup
Updates wp-config.php variables in the current dir.
#### wpurl
Lets you read and/or set the home and/or siteurl option for the wordpress site in the current directory.

Run without flags to only read the values.
##### flags
1. -n Sets both to provided argument.
2. -h Sets home to provided argument.
3. -s Sets siteurl to provided argument.

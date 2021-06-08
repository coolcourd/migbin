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
#### domainlist
If run in BH brand accounts, prints off current directory list and their assigned document roots.
#### dumpdb
Alternative for dumping wp databases, doesn't use wpcli, works on older wp versions.
#### exportdbs
exports all databases placing them in ~/migration_dbs/dbs
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
#### free_wordpress
Accepts a php version, WordPress version and list of urls to WordPress backup files and installs the site in the current directory.

example usage:

```$ free_wordpress --wp-version="5.3.3" --php-version="7.3" https://url.1 https://url.2 https://url.3 ...```

urls are automatically detected in the command-line arguments.

##### flags
* -h --help : displays this message
* -t --test : runs automated testing on the functions in this file.
* -w --wordpress-version : sets the wordpress version of the install
* -p --php-version : sets the php version of the install
#### getmysites
Builds an outline of all wordpress sites on the account and saves to ~/migration/migstuff/mysites.txt
#### httpit
Sets WordPress site in current working directory to us http:// protocol for the home and siteurl options.
#### httpsit
Sets WordPress site in current working directory to us https:// protocol for the home and siteurl options.
#### importpsbu
Imports a psbu db and all.
#### listwp
Search for all Wordpress websites and lists the URL and filepath for each. You can pass in a domain to search for specifically.

Example:
* listwp domain.com

#### lftpline
Prompts for lftp creds to autogenerate lftp line.

##### flags
* -go --opens lftp connection instead of printing line
#### mailprep
Prompts you for a list of imap lines and creates email accounts for you. Does not play nicely with some passwords.

Imap lines look like this:
source-imap-mailserver source-email-address source-password destination-imap-mailserver destination-email-address destination-password
#### mailsync
syncs etc and mail.  used to sync an individual domain.
does not overwrite existing pw files. 
outputs mailcount differences.
example: 
* mailsync example.com # syncs mail for example.com
#### mainurlit
sets the tempurl back to the main url based on the .mainurl file located in the cwd
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
#### migssl
purges the cache and runs a search-replace for wordpress sites.

##### flags
* -on  --secures site, replaces http links with https
* -off --disables https for the site, deactivates a few plugins which force ssl on wp sites.
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
#### setmainurls
looks for .mainurl files and sets the WordPress home and siteurl options to it's contents
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
#### wpinstall
Installs a fresh wordpress site or repairs existing. 

##### flags
* -db --runs wpdbimport after install
#### wpjquery
Installs and activates the plugin enable-jquery-migrate-helper for wp sites w/ js errors
#### wplive
configures a wordpress site from the backup directory to it's live directory
example:
* wplive ~/migration/files/ ~/public_html
#### wptoggle
Lists all active plugins and toggles off then on. Situational use only, deactivating plugins can cause issues w/ sites db's.
#### wpup
Updates wp-config.php variables in the current dir.
#### wpurl
Lets you read and/or set the home and/or siteurl option for the wordpress site in the current directory.

Run without flags to only read the values.
##### flags
* -n Sets both to provided argument.
* -h Sets home to provided argument.
* -s Sets siteurl to provided argument.

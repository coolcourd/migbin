main_domain=$(uapi DomainInfo list_domains 2>/dev/null | awk '$1 ~ "main_domain:" {print $2}')
PS1='\[\e[92m\]\u@${main_domain}\[\e[31m\]:\[\e[35m\]\w\[\e[0m\][$?] \$ '
RED="\e[31m"
GREEN="\e[32m"
SET="\e[0m"
BLINK="\e[5m"
UNBLINK="\e[25m"
BLUESH="\e[44m"
SETSH="\e[49m"
alias gopub="cd ~/public_html"
alias htoff='mv .htaccess .htaccessOFF'
alias hton='mv .htaccessOFF .htaccess'
alias db='grep DB_ wp-config.php'
alias wpsqlurl="grep -oP siteurl\',\ ?\'[a-zA-Z0-8:/\.~]+\' "
function mkcd() {
    for x in "$@"; do
        mkdir -p "$x"
    done
    cd "${@: -1}"
}
if [[ ! $(echo $PATH | grep migbin) ]]; then
    PATH=$PATH:~/bin/migbin
fi
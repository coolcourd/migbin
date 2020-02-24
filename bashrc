main_domain=$(uapi DomainInfo list_domains 2>/dev/null | awk '$1 ~ "main_domain:" {print $2}')
PS1='\[\e[92m\]\u@${main_domain}\[\e[31m\]:\[\e[35m\]\w\[\e[0m\][$?] \$ '
PATH=$PATH:~/migration/migbin
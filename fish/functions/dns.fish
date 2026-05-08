function dns --argument-names 'fqdn' --description "Look up IPs via the Mac OS DNS utility. Alternative to dig or nslookup."
    dscacheutil -q host -a name $fqdn
end


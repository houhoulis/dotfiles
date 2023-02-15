function dns --argument-names 'fqdn' --description "Look up IPs via the Mac OS DNS utility. Better than dig."
    dscacheutil -q host -a name $fqdn
end


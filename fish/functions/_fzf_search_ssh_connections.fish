function _fzf_search_ssh_connections --description="Search the list of known SSH connections"
    set token (commandline --current-token)
    if set split_token (string split --max 1 @ $token)
        set username $split_token[1]
        set server_name $split_token[2]
    else
        set username ""
        set server_name $token
    end
    set selection (
        __fish_print_hostnames | \
        _fzf_wrapper --query=$server_name $fzf_ssh_opts
    )
    if test $status -eq 0
        if test -n $username
            set result $username@$selection
        else
            set result $selection
        end
        commandline --current-token --replace $result
    end

    commandline --function repaint
end

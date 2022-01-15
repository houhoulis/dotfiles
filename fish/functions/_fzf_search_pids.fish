function _fzf_search_pids --description="Search for a pid"
    # If procs (https://github.com/dalance/procs) is available, use it.
    if type -q procs
        set pids_command procs --color=always --no-header
    else
        set pids_command ps --no-headers -o pid,user,command -e
    end
    set selected_lines (
        $pids_command |
        _fzf_wrapper --ansi \
            --multi \
            --query=(commandline --current-token) \
            --tiebreak=index \
            $fzf_pid_opts
    )
    if test $status -eq 0
        for line in $selected_lines
            set pid (string match --regex '^\\s*(\\d+)' $line)[2]
            set pids $pids $pid
        end
        commandline --current-token --replace (string join ' ' $pids)
    end

    commandline --function repaint
end

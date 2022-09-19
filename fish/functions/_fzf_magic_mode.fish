function _fzf_magic_mode
    set --local cmd (commandline --current-process --tokenize)
    switch $cmd[-1]
        case '$*'
            eval $_fzf_search_vars_command
            return
    end

    switch $cmd[1]
        case set '$*'
            eval $_fzf_search_vars_command
        case git
            switch $cmd[2]
                case branch checkout rebase merge log
                    _fzf_search_git_branches
                case cherry-pick revert
                    _fzf_search_git_log
                case add
                    _fzf_search_git_status
            end
        case kill
            _fzf_search_processes
        case cd vi vim nvim l ls ll
            _fzf_search_directory
        case '*'
            _fzf_complete
    end
end

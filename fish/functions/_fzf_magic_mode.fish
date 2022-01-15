function _fzf_magic_mode
    set cmd (commandline --current-process)

    set variable_patterns '\\$$' '^set\\b'
    set git_branch_patterns '^git\\s+branch\\b' '^git\\s+checkout\\b' '^git\\s+rebase\\b' '^git\\s+merge\\b' '^git\\s+log\\b'
    set git_log_patterns '^git\\s+cherry-pick\\b' '^git\\s+revert\\b'
    set git_status_patterns '^git\\s+add\\b'
    set ssh_patterns '^ssh\\b'
    set pid_patterns '^kill\\b'
    set file_patterns '^cd\\b' '^vim\\b' '^ls\\b' '^ll\\b'

    set patterns \
        variable_patterns \
        git_branch_patterns \
        git_log_patterns \
        ssh_patterns \
        pid_patterns \
        file_patterns
    set pattern_functions \
        "$_fzf_search_vars_command" \
        _fzf_search_git_branches \
        _fzf_search_git_log \
        _fzf_search_ssh_connections \
        _fzf_search_pids \
        _fzf_search_directory

    for pattern_index in (seq (count $patterns))
        for pattern in $$patterns[$pattern_index]
            if string match --regex $pattern $cmd
                set matched_pattern $pattern_index
                break
            end
        end
        if test -n "$matched_pattern"
            break
        end
    end

    if test -n "$matched_pattern"
        eval $pattern_functions[$matched_pattern]
    end
end

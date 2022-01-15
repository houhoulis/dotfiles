function _fzf_search_git_branches --description "Search the output of git branches and preview git log. Replace the current token with the selected branch name"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo '_fzf_search_git_branches: Not in a git repository.' >&2
    else
        set format_str '%(color:bold blue)%(refname:short)%(color:reset) - %(color:cyan)%(authordate:short)%(*authordate:short)%(color:reset) %(contents:subject)  %(color:dim)[%(authorname)%(*authorname)]'
        set selected_line (
            git for-each-ref --color=always --sort='-authordate' --format="$format_str" refs/heads refs/remotes refs/tags | \
            _fzf_wrapper --ansi \
                --tiebreak=index \
                --preview='git log --stat --decorate --color=always {1}' \
                --query=(commandline --current-token) \
                $fzf_git_branch_opts
        )
        if test $status -eq 0
            set ref_name (string split --max 1 " " $selected_line)[1]
            commandline --current-token --replace $ref_name
        end
    end

    commandline --function repaint
end

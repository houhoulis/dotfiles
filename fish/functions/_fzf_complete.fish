function _fzf_complete --description "Use fzf to search the completions for the current commandline"
    set --local version_split (string split . $FISH_VERSION)
    # complete --escape was added in fish 3.4.0
    if test $version_split[1] -gt 3 -o $version_split[2] -ge 4
        set escape_flag --escape
    else if not set -q __fzf_complete_without_escape
        echo "Using fzf complete in fish version < 3.4.0 is unsafe because of lack of --escape flag."
        echo "To enable anyway define a __fzf_complete_without_escape variable."
        return 1
    end

    set -g cmd (commandline --cut-at-cursor --tokenize) (commandline --cut-at-cursor --current-token)
    set -g completions (complete -C $escape_flag (string join ' ' $cmd)); or return 2
    if test $status -ne 0; or not set -q completions[1]
        # No comletions available
        return 3
    end

    if not set -q completions[2]
        # If there is only one completion, we'll just use that
        set selected_completion $completions[1]
    else
        set --local awk_program (string join '' \
                '{printf("' \
                (set_color $fish_pager_color_completion) \
                '%s\t(' \
                (set_color $fish_pager_color_description) \
                '%s' \
                (set_color normal) \
                 ')\n", $1, $2)}'
            )
        set selected_completion (
                string join -- \n $completions[-1..1] | \
                awk -F '\t' $awk_program | \
                _fzf_wrapper --tiebreak=index --ansi --query $cmd[-1]
            )
        if test $status -ne 0 -o -z "$selected_completion"
            commandline --function repaint
            return 4
        end
    end
    set --local completion_token (echo $selected_completion | cut -f1)
    commandline --current-token --replace $completion_token
    commandline --function repaint
end

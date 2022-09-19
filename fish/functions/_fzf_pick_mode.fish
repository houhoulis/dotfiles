function _fzf_pick_mode --description "Use fzf to pick the fzf mode"
    set -l selected_function ( \
        string join -- \n (__fzf_get_binding_strings) \
        | _fzf_wrapper --ansi --delimiter=\t --nth=1 --with-nth=1 \
        | cut -f2
    )
    if test -z "$selected_function"
        commandline --function repaint
        return
    end
    eval $selected_function
end

function __fzf_capitalize
    echo $argv | sed 's/_/ /g;s/[^ ]*/\u&/'
end

function __fzf_friendly_bind
    string escape $argv | sed 's/\\\\e/Alt+/;s/\\\\c/Ctrl+/'
end

function __fzf_get_binding_strings
    for i in (seq (count $_fzf_key_sequence_descriptions))
        echo (__fzf_capitalize $_fzf_key_sequence_descriptions[$i]) \
            " (" \
            (set_color $fish_pager_color_description) \
            (__fzf_friendly_bind $_fzf_key_sequences[$i]) \
            (set_color normal) \
            ")"\t"$_fzf_key_binded_functions[$i]"
    end
end

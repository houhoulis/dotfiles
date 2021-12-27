function fish_prompt
    # set -l -u current_path (echo (pwd) | sed s=$HOME=~=)
    # echo $current_path "⚡"(set_color 491)"·› "(set_color normal)

    set -l gitbranch (git branch --show-current 2>/dev/null)
    if test -n "$gitbranch"
        set gitbranch (set_color 491)"($gitbranch) "
    else
        set gitbranch ''
    end
    # dunno the canonical way to substitute abbreviated home path ("~") when appropriate
    echo "$status" (set_color brblue)(echo (pwd) | sed s=$HOME=~=)" "(echo "$gitbranch")"⚡"(set_color brmagenta)"·› "(set_color normal)
end


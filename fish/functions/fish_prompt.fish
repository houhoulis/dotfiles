function fish_prompt
    # set -l -u current_path (echo (pwd) | sed s=$HOME=~=)
    # echo $current_path "⚡"(set_color 491)"·› "(set_color normal)

    set -l gitbranch (git branch --show-current 2>/dev/null)
    if test -n "$gitbranch"
        if test -n (echo (git status --short))
            set -l dirty ''
            string split "\n" (git status --short) | while read -l dirtyline
                set dirty $dirty(string split -n -f1 ' ' $dirtyline)
            end
            set gitbranch (set_color 491)"($gitbranch $dirty"(set_color 491)") "
        else
            set gitbranch (set_color 491)"($gitbranch) "
        end
    end

    # dunno the canonical way to substitute abbreviated home path ("~") when appropriate
    echo "$status" (set_color brblue)(echo (pwd) | sed s=$HOME=~=)" "(echo "$gitbranch")"⚡"(set_color brmagenta)"·› "(set_color normal)
end


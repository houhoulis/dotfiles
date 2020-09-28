function fish_prompt
    # dunno the canonical way to display abbreviated home path ("~") when you can

#    set_color purple

    echo "$status" (set_color purple)(echo (pwd) | sed s=$HOME=~=) "⚡"(set_color 491)"·› "(set_color normal)
    # set -l -u current_path (echo (pwd) | sed s=$HOME=~=)
    # echo $current_path "⚡"(set_color 491)"·› "(set_color normal)
end


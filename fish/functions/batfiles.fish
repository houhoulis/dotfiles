function batfiles --argument-names 'filename' 'path' 'lines' -d "Search for file(s) by name (1st arg) under the given dir (2nd arg, or current dir) and display the first n (3rd arg) lines of each."
    test -n "$lines" ; or set -l lines 3

    set -l find_result
    if test -z "$path"
        set find_result (fd --hidden --exclude .git/ --exclude node_modules/ "$filename")
    else
        set find_result (fd --hidden --exclude .git/ --exclude node_modules/ "$filename" "$path")
    end

    if test -z "$find_result"
        echo "No files found."
    else
        bat --line-range ":$lines" -- $find_result
    end
end


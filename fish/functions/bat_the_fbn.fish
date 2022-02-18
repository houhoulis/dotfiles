function bat_the_fbn --argument-names 'filename' 'path' -d "find by name. Displays the first few lines of a file or files found by name under the given dir (2nd arg) or else current dir"
    set -l find_result
    if test "$path" = ""
        set find_result (fbn "$filename")
    else
        set find_result (fbn "$filename" "$path")
    end

    if test -z "$find_result"
        echo "No files found."
    else
        bat --line-range :3 -- $find_result
    end
end


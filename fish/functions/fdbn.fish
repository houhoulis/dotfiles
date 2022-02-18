# based on 'fbn' from masukomi, but ported from find to fd
function fdbn --argument-names 'filename' 'path' -d "Look for a file by filename pattern under the passed-in dir (2nd arg) or else current dir"
    if test "$path" = ""
        fd "$filename"
    else
        fd "$filename" "$path"
    end
end


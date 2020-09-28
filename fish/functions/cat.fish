function cat
    if test (which bat)
        bat $argv
    else
        /bin/cat $argv
    end
end


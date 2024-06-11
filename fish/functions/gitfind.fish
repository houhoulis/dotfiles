function gitfind
    argparse p -- $argv
    or return

    if set -ql _flag_p
        git log --all --source -p -S$argv
    else
        git log --all --source -S$argv
    end
end

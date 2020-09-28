function fish_title
    # Original:
    # # Defined in /usr/local/Cellar/fish/3.1.2/share/fish/functions/fish_title.fish @ line 1
    # function fish_title
    #      # emacs is basically the only term that can't handle it.
    #      if not set -q INSIDE_EMACS
    #          echo (status current-command) (__fish_pwd)
    #      end
    # end

    # The original fish_title overrides iTerm2's config options, such that
    # it's both too long and does not appear to change when a command-line
    # program is running.

    if not set -q INSIDE_EMACS
        set -l shortened_dir ''
        if [ (pwd) = $HOME ]
            set shortened_dir "~"
        else
            set shortened_dir ".."(echo (string sub --start=-8 (echo (string split -r -m1 / (pwd))[-1])))
        end
        echo $shortened_dir":" (status current-command)
    end
end


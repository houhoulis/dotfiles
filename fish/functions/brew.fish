function brew
    # Trying to stay one step ahead of Homebrew's desire to enforce evergreen
    # dependency management ("upgrade everything and delete all old versions").
    # For HOMEBREW_NO_INSTALL_CLEANUP, see https://brew.sh/2019/02/02/homebrew-2.0.0/
    # For HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS, see https://brew.sh/2020/12/21/homebrew-2.7.0/

    # echo $HOMEBREW_NO_INSTALL_CLEANUP | read -l noinstall
    # echo $HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS | read -l noperiodic
    set -l noinstall $HOMEBREW_NO_INSTALL_CLEANUP
    set -l noperiodic $HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS

    if test -n $noinstall
    and test -n $noperiodic
    and test $noperiodic -ge 36500
        echo -e "HOMEBREW_NO_INSTALL_CLEANUP is set to '$noinstall', and HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS is\n set to '$noperiodic', which seems sufficient."
        read -l -P "Continue? [y/N] " confirm
        if test "$confirm" = 'y'
            /usr/local/bin/brew $argv
        else
            echo "Okay. 🤟🏼"
        end
    else
        echo "Quitting. Either \$HOMEBREW_NO_INSTALL_CLEANUP ('$noinstall') isn't set in env, or \$HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS ('$noperiodic') isn't set high enough."
        return 1
    end
end


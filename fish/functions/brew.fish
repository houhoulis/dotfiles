function brew
    # Trying to stay one step ahead of Homebrew's desire to enforce evergreen
    # dependency management ("upgrade everything and delete all old versions").
    # For HOMEBREW_NO_INSTALL_CLEANUP, see https://brew.sh/2019/02/02/homebrew-2.0.0/
    # For HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS, see https://brew.sh/2020/12/21/homebrew-2.7.0/
    # I don't see any release notice for HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK, but I saw it
    # on the command line at the beginning of the "upgrade all the formula that depend on
    # what you just upgraded" phase.

    set -l nodependentspidering $HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK
    set -l nocleanup $HOMEBREW_NO_INSTALL_CLEANUP
    set -l cleanupperiod $HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS

    if test -n "$nodependentspidering"
    and test -n "$nocleanup"
    and test -n "$cleanupperiod"
    and test $cleanupperiod -ge 36500
        echo -e "HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK is set to '$nodependentspidering', and\nHOMEBREW_NO_INSTALL_CLEANUP is set to '$nocleanup', and\nHOMEBREW_CLEANUP_PERIODIC_FULL_DAYS is set to '$cleanupperiod', which seems sufficient."
        read -l -P "Continue? [y/N] " confirm
        if test "$confirm" = 'y'
            /usr/local/bin/brew $argv
        else
            echo "Okay. 🤟🏼"
        end
    else
        echo -e "Quitting. Either \$HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK ('$nodependentspidering') or\n\$HOMEBREW_NO_INSTALL_CLEANUP ('$nocleanup') aren't set in env, or\n\$HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS ('$cleanupperiod') isn't set or isn't large enough."
        return 1
    end
end


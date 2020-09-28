function brew
    test -n (echo $HOMEBREW_NO_INSTALL_CLEANUP)
    and /usr/local/bin/brew $argv
    or echo "Oh no! HOMEBREW_NO_INSTALL_CLEANUP isn't set in env!"
end


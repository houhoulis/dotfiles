function heroku_enable
    echo "'brew tap heroku/brew && brew install heroku' installs an auto-updating client! 👎🏼"
    # See https://devcenter.heroku.com/articles/heroku-cli#download-and-install
    # Instead, for a non-auto-updating client, I installed 'heroku' via npm.
    # This fish function is to make it easier to switch nodes and enable heroku.
    # Here's the prep for this function, which might have to be run again for a node upgrade:
    # * nvm alias heroku <version>
    # * nvm use heroku
    # * npm install -g heroku
    # This makes this fish function more able to survive upgrades -- the above commands can
    # be run to update the nvm alias if the "heroku" version of node is ever upgraded.
    nvm use heroku
end

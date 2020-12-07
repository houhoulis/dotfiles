function heroku_enable
    echo "'brew tap heroku/brew && brew install heroku' installs an auto-updating client! 👎🏼"
    # See https://devcenter.heroku.com/articles/heroku-cli#download-and-install
    # Instead, I ran "npm install -g heroku", for a non-auto-updating client, under node v15.3
    nvm use v15.3.0
end

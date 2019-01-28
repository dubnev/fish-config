## Pre-requirements

`brew install git` (you probably already have this)

## Steps

Install Fish
`brew install fish`

Add Fish to known shells
`echo /usr/local/bin/fish | sudo tee -a /etc/shells`

Make Fish your default shell (optional, but why are you here?)
`chsh -s /usr/local/bin/fish`

I'll update my config to automatically download fisher and all necessary
packages if not already present, but need to do the following for time being.

Install Fisher, a Fish package manager, and init
`curl https://git.io/fisher --create-dirs -sLo
~/.config/fish/functions/fisher.fish && fisher`

Install bass for bash compatibility
`fisher add edc/bass`

That should get you good to go.

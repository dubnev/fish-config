## Pre-requirements

`brew install git` (you probably already have this)

## Steps

Install Fish
`brew install fish`

Add Fish to known shells
`echo /usr/local/bin/fish | sudo tee -a /etc/shells`

Make Fish your default shell (optional, but why are you here?)
`chsh -s /usr/local/bin/fish`

Place the `fish_config` and `fish_funcs` directories in `~/.fish`.

Place `config.fish` in `~/.config/fish/`.

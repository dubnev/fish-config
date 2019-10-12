## Pre-requirements

`brew install git` (you probably already have this)

## Steps

Assumes Mac, replace paths/package manager as desired for your Linux distro. 
Configuration should be portable.

Install Fish
`brew install fish`

Add Fish to known shells
`echo /usr/local/bin/fish | sudo tee -a /etc/shells`

(Optional) Make Fish your default shell
`chsh -s /usr/local/bin/fish`

Place the `fish_config` and `fish_funcs` directories in `~/.fish/`.

Place `config.fish` in `~/.config/fish/`.

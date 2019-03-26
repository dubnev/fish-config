# Suppress intro fish message
set fish_greeting

# Initialize pyenv, suppress output
pyenv init - | source

# Re-add all SSH keys in case they got dropped
eval 'ssh-add -A' > /dev/null 2>&1

# Source custom fish functions
for file in ~/.fish/fish_funcs/*
    source $file
end

# Source other fish configuration
for file in ~/.fish/fish_config/*
    source $file
end

# Update PATH for gcloud SDK
# bass source '/Applications/google-cloud-sdk/path.bash.inc'
set --export PATH $PATH /Applications/google-cloud-sdk/bin

# Shell command completion for gcloud cli
bass source '/Applications/google-cloud-sdk/completion.bash.inc'


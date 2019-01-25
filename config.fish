# Initialize pyenv, suppress output
eval 'pyenv init -' > /dev/null

# Source custom fish functions
for file in ~/.fish/fish_funcs/*
    source $file
end

# Source other fish configuration
for file in ~/.fish/fish_config/*
    source $file
end

# Update PATH for gcloud SDK
bass source '/Applications/google-cloud-sdk/path.bash.inc'

# Shell command completion for gcloud cli
bass source '/Applications/google-cloud-sdk/completion.bash.inc'


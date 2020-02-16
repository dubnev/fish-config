# Suppress intro fish message
set fish_greeting

# Initialize pyenv, suppress output
pyenv init - --no-rehash | source

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

# Update limit for max open file descriptors
ulimit -n 200000
ulimit -u 2048

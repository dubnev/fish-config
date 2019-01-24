# Initialize pyenv, suppress output
eval 'pyenv init -' > /dev/null

# Source custom fish functions
source ~/.fish_funcs/.*

# Source other fish configuration
source ~/.fish_config/.*

# Update PATH for gcloud SDK
bass source '/Applications/google-cloud-sdk/path.bash.inc'

# Shell command completion for gcloud cli
bass source '/Applications/google-cloud-sdk/completion.bash.inc'


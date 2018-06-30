if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# added by Anaconda3 4.4.0 installer
export PATH="/Users/humana/anaconda/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/humana/tmp/google-cloud-sdk/path.bash.inc' ]; then source '/Users/humana/tmp/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/humana/tmp/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/humana/tmp/google-cloud-sdk/completion.bash.inc'; fi

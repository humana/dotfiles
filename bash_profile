if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# added by Anaconda3 4.4.0 installer
# export PATH="/Users/work/anaconda/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/work/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/work/anaconda/etc/profile.d/conda.sh" ]; then
        . "/Users/work/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/work/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


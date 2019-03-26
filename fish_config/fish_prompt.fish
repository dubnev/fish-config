function fish_prompt

	# Determine if last call was successful
	set -l pre_prompt_status $status

	# New line between prompts
	echo

	# -----
	# PWD
	# -----
	set -l dir
	set -l git_root (command git rev-parse --show-toplevel 2>/dev/null)
	if test -n "$git_root"
		set -l resolvedPWD (pwd -P 2>/dev/null; or pwd)
		set dir (string replace $git_root (basename $git_root) $resolvedPWD)
	else
		set -l realhome ~
		set dir (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
	end

	set_color --bold cyan
	echo -e -n $dir


	# -----
	# Git
	# -----
	set -l git_branch (get-git-branch)

	if test -n "$git_branch"
		set_color --bold magenta
		echo -e -n "  $git_branch"

		# Check for git status options (added, modified, unstaged, etc.)
		set -l git_status
		set -l git_index (command git status --porcelain 2>/dev/null -b)
		set -l trimmed_index (string split \n $git_index | string sub --start 1 --length 2)
		for i in $trimmed_index
			if test (string match '\?\?' $i)
				set git_status $git_status "?"
			end
			if test (string match '*A*' $i)
				set git_status $git_status "+"
			end
			if test (string match '*M*' $i)
				set git_status $git_status "!"
			end
			if test (string match '*R*' $i)
				set git_status $git_status "»"
			end
			if test (string match '*D*' $i)
				set git_status $git_status "✘"
			end
			if test (string match '*U*' $i)
				set git_status $git_status "="
			end
		end

		# Check for stashes
		if test -n (echo (command git rev-parse --verify refs/stash 2>/dev/null))
			set git_status $git_status "\$"
		end

		# Check whether the branch is ahead
		if test (string match '*ahead*' $index)
			set is_ahead true
		end

		# Check whether the branch is behind
		if test (string match '*behind*' $index)
			set is_behind true
		end

		# Check whether the branch has diverged
		if test "$is_ahead" = "true" -a "$is_behind" = "true"
			set git_status $git_status "⇕"
		else if test "$is_ahead" = "true"
			set git_status $git_status "⇡"
		else if test "$is_behind" = "true"
			set git_status $git_status "⇣"
		end

		# If there are any status changes, fill it out
		if test (count $git_status) -gt 0
			set_color --bold red
			echo -e -n " ["
			for val in $git_status
				echo -e -n "$val"
			end
			echo -e -n "]"
		end
	end


	# ----------
	# Virtualenv
	# ----------
	if test -n "$VIRTUAL_ENV"
		set_color --bold yellow
		echo -e -n " ("
		echo -e -n (basename "$VIRTUAL_ENV")
		echo -e -n ")"
	end


	# Prompt char (lambda) should be on own line, inserting newline
	echo -e -n \n


	# -----
	# Lambda
	# -----
	if test $pre_prompt_status -eq 0
		set_color --bold green
	else
		set_color --bold red
	end
	echo -e -n "λ "


	# Reset color (just in case something else uses)
	set_color normal
end

#!/bin/bash

get_subtasks_from_main(){
	if [ -s main.yml ]; then
		if grep -q 'import_tasks:' main.yml; then
			awk -F: '/import_tasks:/ {gsub(/ /,"",$NF); print $NF}' main.yml
		else
			cat <<-'EOF' > main.yml
			---
	
			# vim: cursorcolumn cursorline cc=80 ts=2 sw=2 ai
	
			- name: Description
			  import_tasks: generic-tasks.yml

			EOF
		fi
	fi
}

for subtask_file in $(get_subtasks_from_main); do
	if [ ! -s $subtask_file -a "$subtask_file" != "generic-tasks.yml" ]; then
		cat <<-'EOF' > $subtask_file
		---

		# vim: cursorcolumn cursorline cc=80 ts=2 sw=2 ai

		EOF
	fi
done


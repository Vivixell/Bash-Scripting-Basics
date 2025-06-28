#!/bin/bash

task="$HOME/todo.txt"

if [ ! -f "$task" ]; then

	touch "$task"
fi



view_task(){
	if [ ! -s "$task" ]; then
		echo "Your To-DO list is empty"
		echo "existing..."
		sleep 2
	else

		echo "Loading your task, please wait..."
		sleep 2
		cat -n "$task"
	fi
}



add_task() {
	while true; do

		read -p "Enter your new task ( or 'q' to quit): " new_task

		if [[ "$new_task" == "q" || "$new_task" == "Q" ]]; then
			echo "Existing..."
			sleep 2
			echo ""
			break
		fi

		
		if [ ${#new_task} -lt 3 ]; then
			echo "Task must be at least 3 character long!"
			echo "Existing ..."
			echo ""
			sleep 2
		else
			echo "$new_task" >> "$task"
			echo "Saving..."
			echo ""
			sleep 2
			echo "Task Added"
		fi
	done

}



delete_task() {


	if [ ! -s "$task" ]; then
		echo "You don't have any tasks being tracked currently"
		echo "Exiting..."
		echo ""
		sleep 2
		return

	fi

	while true; do
		echo "Current task"
		cat -n "$task"
		echo ""

		read -p "Enter the task number to delete ( or 'q' to quit ): " num

		if [[ "$num" == "q" || "$num" == "Q" ]]; then
			echo "Exiting delete menu ..."
			echo ""
			sleep 2
			break

		fi


		

		if ! [[ "$num" =~ ^[0-9]+$ ]]; then

			echo "Invalid input: Input can only contain numbers"
			echo ""
			continue

		fi

		

		total_length=$(wc -l < "$task")

		if [ "$num" -lt 1 ] || [ "$num" -gt "$total_length" ]; then
			
			echo "You can only delete tasks from 1 - '$total_length' "
			echo ""
			continue
		fi
	

		sed -i "${num}d" "$task"
		echo "Deleteing Task No. '$num' ......."
		echo ""
		sleep 2
		echo "Task Deleted!"
	done



}

echo "Welcome to your To-Do list!"

while true; do
	echo ""
	echo "==== To-Do Menu ===="
	echo "1. View all task"
	echo "2. Add new task"
	echo "3. Delete a task"
	echo "4. Exit"

	read -p "Choose an option 1-4): " choice

	case $choice in 
		1)
			view_task
			;;
		2)
			add_task
			;;

		3)
			delete_task
			;;
		4)
			echo "GoodBye..."
			exit 0
			;;
		*)
			echo "Invalid choice. Try again."
			;;
	esac

done

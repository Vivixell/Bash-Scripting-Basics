# Bash To-Do List Manager 

This is a simple automation task in Bash. Here's what I achieved using this script:

- ✅ Create a script named `todo.sh`
- ✅ Display a menu with the following options:
  - View all tasks
  - Add a new task
  - Delete a task
  - Exit the program
- ✅ Store tasks in a file named `todo.txt` in the user’s home directory (`~/todo.txt`)
- ✅ Use numbered lines so tasks can be deleted by their number
- ✅ Keep running in a loop until the user chooses to exit

---

##  How It Works 💡

This a  simple scripting task with bash
 simple interactive terminal based to-do list app written in Bash. Users can view, add, or delete tasks with a clean and guided interface.

---

##  Script Breakdown


###  File Path Setup

```bash
task="$HOME/todo.txt"

if [ ! -f "$task" ]; then
    touch "$task"
fi
````

* Ensures `todo.txt` exists in the user's home directory.
* If it doesn't, the script creates it.

---

###  `view_task` Function

```bash
view_task() {
    if [ ! -s "$task" ]; then
        echo "Your To-DO list is empty"
        ...
    else
        cat -n "$task"
    fi
}
```

* Checks if the file is empty.
* If not, it displays tasks **with line numbers** using `cat -n`.

---

###  `add_task` Function

```bash
add_task() {
    while true; do
        read -p "Enter your new task (or 'q' to quit): " new_task
        ...
        echo "$new_task" >> "$task"
    done
}
```

* Repeatedly asks for a new task.
* Accepts only tasks with 3+ characters.
* Typing `q` or `Q` exits the input loop.
* Each task is appended to `todo.txt`.

---

### `delete_task` Function

```bash
delete_task() {
    if [ ! -s "$task" ]; then
        echo "No tasks to delete"
        return
    fi
    ...
    sed -i "${num}d" "$task"
}
```

* Displays current tasks with line numbers.
* Validates input:

  * Only numbers allowed
  * Must be within the number of tasks available
  * User can press `q` to cancel
* Deletes the task using `sed -i`.

---

###  Main Menu Loop 🔁

```bash
while true; do
    echo "1. View all task"
    echo "2. Add new task"
    echo "3. Delete a task"
    echo "4. Exit"
    
    read -p "Choose an option (1-4): " choice
    
    case $choice in
        1) view_task ;;
        2) add_task ;;
        3) delete_task ;;
        4) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid choice. Try again." ;;
    esac
done
```

* Keeps the app running in a loop.
* Lets the user choose between the four available options.
* Cleanly exits when the user selects `4`.

---



## 📁 Project Structure

```
.
├── todo.sh       # The main script
└── README.md     # Project documentation
```

---

##  Commands & Tools Used

* `read` – Get user input
* `cat -n` – Show tasks with line numbers
* `echo` – Display messages / append to file
* `sed -i` – Delete task by line number
* `wc -l` – Count number of lines

---

##  To Run the Script

```bash
chmod +x todo.sh   # Give it execute permission
./todo.sh          # Run the script
```

---

##  Final Thoughts

This project is a beginner-friendly introduction to Bash scripting. It covers loops, conditionals, user input, and file manipulation; all wrapped in a practical mini project.

Feel free to fork it and add more features like:

* Edit task
* Mark task as completed
* Save with timestamps

---



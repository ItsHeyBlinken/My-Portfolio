document.addEventListener('DOMContentLoaded', () => {
    const todoForm = document.getElementById('todo-form');
    const todoInput = document.getElementById('todo-input');
    const todoDate = document.getElementById('todo-date');
    const todoPriority = document.getElementById('todo-priority');
    const todoList = document.getElementById('todo-list');
    const completedList = document.getElementById('completed-list');
    const filterDateBtn = document.getElementById('filter-date');
    const filterPriorityBtn = document.getElementById('filter-priority');
    const exportBtn = document.getElementById('export-btn');
    const importFile = document.getElementById('import-file');
    const importBtn = document.getElementById('import-btn');
    const clearCompletedBtn = document.getElementById('clear-completed-btn');

    // Load tasks from local storage
    loadTasks();

    todoForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const newTodoText = todoInput.value.trim();
        const newTodoDate = todoDate.value;
        const newTodoPriority = todoPriority.value;
        
        // Input validation
        if (newTodoText === '') {
            showMessage('Please enter a task description', 'error');
            return;
        }
        
        if (newTodoDate && !isValidDate(newTodoDate)) {
            showMessage('Please enter a valid date', 'error');
            return;
        }
        
        addTodoItem(newTodoText, newTodoDate, newTodoPriority);
        todoInput.value = '';
        todoDate.value = '';
        todoPriority.value = 'low';
        saveTasks();
        showMessage('Task added successfully!', 'success');
    });

    filterDateBtn.addEventListener('click', () => {
        sortTasks('date');
        showMessage('Tasks sorted by date', 'info');
    });

    filterPriorityBtn.addEventListener('click', () => {
        sortTasks('priority');
        showMessage('Tasks sorted by priority', 'info');
    });

    exportBtn.addEventListener('click', () => {
        try {
            exportTasks();
            showMessage('Tasks exported successfully!', 'success');
        } catch (error) {
            showMessage('Export failed: ' + error.message, 'error');
        }
    });

    importBtn.addEventListener('click', () => {
        importFile.click();
    });

    importFile.addEventListener('change', (e) => {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = (e) => {
                try {
                    const tasks = JSON.parse(e.target.result);
                    if (Array.isArray(tasks)) {
                        localStorage.setItem('tasks', JSON.stringify(tasks));
                        loadTasks();
                        showMessage('Tasks imported successfully!', 'success');
                    } else {
                        throw new Error('Invalid file format');
                    }
                } catch (error) {
                    showMessage('Import failed: Invalid file format', 'error');
                }
            };
            reader.onerror = () => {
                showMessage('Import failed: Could not read file', 'error');
            };
            reader.readAsText(file);
        }
    });

    clearCompletedBtn.addEventListener('click', () => {
        clearCompletedTasks();
        showMessage('Completed tasks cleared', 'info');
    });

    function addTodoItem(text, date, priority, completed = false) {
        const tr = document.createElement('tr');
        
        // Apply priority class for color coding
        tr.classList.add(`priority-${priority}`);
        
        const checkboxTd = document.createElement('td');
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.checked = completed;
        checkbox.addEventListener('change', () => {
            tr.classList.toggle('completed', checkbox.checked);
            moveTask(tr, checkbox.checked);
            saveTasks();
            showMessage(checkbox.checked ? 'Task marked as complete!' : 'Task marked as incomplete!', 'info');
        });
        checkboxTd.appendChild(checkbox);
        tr.appendChild(checkboxTd);

        const textTd = document.createElement('td');
        textTd.textContent = text;
        textTd.classList.add('todo-text');
        tr.appendChild(textTd);

        const dateTd = document.createElement('td');
        dateTd.textContent = formatDateForDisplay(date);
        tr.appendChild(dateTd);

        const priorityTd = document.createElement('td');
        // Create priority label with visual styling
        const priorityLabel = document.createElement('span');
        priorityLabel.textContent = priority.charAt(0).toUpperCase() + priority.slice(1);
        priorityLabel.classList.add('priority-label', priority);
        priorityTd.appendChild(priorityLabel);
        tr.appendChild(priorityTd);

        const actionsTd = document.createElement('td');
        const editBtn = document.createElement('span');
        editBtn.textContent = 'Edit';
        editBtn.classList.add('edit');
        editBtn.addEventListener('click', () => {
            enableInlineEditing(tr, textTd, dateTd, priorityTd);
        });
        actionsTd.appendChild(editBtn);

        const deleteBtn = document.createElement('span');
        deleteBtn.textContent = 'X';
        deleteBtn.classList.add('delete');
        deleteBtn.addEventListener('click', () => {
            if (confirm('Are you sure you want to delete this task?')) {
                tr.remove();
                saveTasks();
                showMessage('Task deleted successfully!', 'success');
            }
        });
        actionsTd.appendChild(deleteBtn);
        tr.appendChild(actionsTd);

        tr.classList.toggle('completed', completed);
        if (completed) {
            completedList.appendChild(tr);
        } else {
            todoList.appendChild(tr);
        }
    }

    function enableInlineEditing(tr, textTd, dateTd, priorityTd) {
        const originalText = textTd.textContent;
        const originalDate = dateTd.textContent;
        const originalPriority = priorityTd.querySelector('.priority-label').classList.contains('high') ? 'high' : 
                               priorityTd.querySelector('.priority-label').classList.contains('medium') ? 'medium' : 'low';

        // Create input fields
        const textInput = document.createElement('input');
        textInput.type = 'text';
        textInput.value = originalText;
        textInput.classList.add('edit-input');

        const dateInput = document.createElement('input');
        dateInput.type = 'date';
        dateInput.value = originalDate ? formatDateForInput(originalDate) : '';
        dateInput.classList.add('edit-input');

        const prioritySelect = document.createElement('select');
        prioritySelect.classList.add('edit-input');
        ['low', 'medium', 'high'].forEach(priority => {
            const option = document.createElement('option');
            option.value = priority;
            option.textContent = priority.charAt(0).toUpperCase() + priority.slice(1);
            if (priority === originalPriority) option.selected = true;
            prioritySelect.appendChild(option);
        });

        // Replace content with inputs
        textTd.innerHTML = '';
        textTd.appendChild(textInput);
        dateTd.innerHTML = '';
        dateTd.appendChild(dateInput);
        priorityTd.innerHTML = '';
        priorityTd.appendChild(prioritySelect);

        // Focus on text input
        textInput.focus();

        // Add save/cancel buttons
        const actionsTd = tr.querySelector('td:last-child');
        const originalActions = actionsTd.innerHTML;
        
        actionsTd.innerHTML = '';
        
        const saveBtn = document.createElement('span');
        saveBtn.textContent = 'Save';
        saveBtn.classList.add('save');
        saveBtn.addEventListener('click', () => {
            const newText = textInput.value.trim();
            const newDate = dateInput.value;
            const newPriority = prioritySelect.value;
            
            if (newText === '') {
                showMessage('Task description cannot be empty', 'error');
                return;
            }
            
            if (newDate && !isValidDate(newDate)) {
                showMessage('Please enter a valid date', 'error');
                return;
            }
            
            // Update priority class on the row
            tr.classList.remove('priority-low', 'priority-medium', 'priority-high');
            tr.classList.add(`priority-${newPriority}`);
            
            textTd.textContent = newText;
            dateTd.textContent = formatDateForDisplay(newDate);
            
            // Create new priority label
            const priorityLabel = document.createElement('span');
            priorityLabel.textContent = newPriority.charAt(0).toUpperCase() + newPriority.slice(1);
            priorityLabel.classList.add('priority-label', newPriority);
            priorityTd.innerHTML = '';
            priorityTd.appendChild(priorityLabel);
            
            actionsTd.innerHTML = originalActions;
            saveTasks();
            showMessage('Task updated successfully!', 'success');
        });
        
        const cancelBtn = document.createElement('span');
        cancelBtn.textContent = 'Cancel';
        cancelBtn.classList.add('cancel');
        cancelBtn.addEventListener('click', () => {
            textTd.textContent = originalText;
            dateTd.textContent = originalDate;
            
            // Restore original priority label
            const priorityLabel = document.createElement('span');
            priorityLabel.textContent = originalPriority.charAt(0).toUpperCase() + originalPriority.slice(1);
            priorityLabel.classList.add('priority-label', originalPriority);
            priorityTd.innerHTML = '';
            priorityTd.appendChild(priorityLabel);
            
            actionsTd.innerHTML = originalActions;
        });
        
        actionsTd.appendChild(saveBtn);
        actionsTd.appendChild(cancelBtn);

        // Handle Enter key on text input
        textInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                saveBtn.click();
            }
        });
    }

    function moveTask(tr, completed) {
        if (completed) {
            completedList.appendChild(tr);
        } else {
            todoList.appendChild(tr);
        }
    }

    function saveTasks() {
        try {
            const tasks = [];
            todoList.querySelectorAll('tr').forEach(tr => {
                const text = tr.children[1].textContent;
                const date = tr.children[2].textContent;
                const priority = tr.children[3].textContent;
                const completed = tr.children[0].querySelector('input[type="checkbox"]').checked;
                tasks.push({ text, date, priority, completed });
            });
            completedList.querySelectorAll('tr').forEach(tr => {
                const text = tr.children[1].textContent;
                const date = tr.children[2].textContent;
                const priority = tr.children[3].textContent;
                const completed = tr.children[0].querySelector('input[type="checkbox"]').checked;
                tasks.push({ text, date, priority, completed });
            });
            localStorage.setItem('tasks', JSON.stringify(tasks));
        } catch (error) {
            showMessage('Failed to save tasks: ' + error.message, 'error');
        }
    }

    function loadTasks() {
        try {
            const tasks = JSON.parse(localStorage.getItem('tasks')) || [];
            todoList.innerHTML = '';
            completedList.innerHTML = '';
            tasks.forEach(task => addTodoItem(task.text, task.date, task.priority, task.completed));
        } catch (error) {
            showMessage('Failed to load tasks: ' + error.message, 'error');
            localStorage.removeItem('tasks');
        }
    }

    function sortTasks(criteria) {
        try {
            const tasks = JSON.parse(localStorage.getItem('tasks')) || [];
            if (criteria === 'date') {
                tasks.sort((a, b) => {
                    if (!a.date && !b.date) return 0;
                    if (!a.date) return 1;
                    if (!b.date) return -1;
                    return new Date(a.date) - new Date(b.date);
                });
            } else if (criteria === 'priority') {
                const priorityOrder = { low: 1, medium: 2, high: 3 };
                tasks.sort((a, b) => priorityOrder[a.priority] - priorityOrder[b.priority]);
            }
            todoList.innerHTML = '';
            completedList.innerHTML = '';
            tasks.forEach(task => addTodoItem(task.text, task.date, task.priority, task.completed));
        } catch (error) {
            showMessage('Failed to sort tasks: ' + error.message, 'error');
        }
    }

    function exportTasks() {
        const tasks = JSON.parse(localStorage.getItem('tasks')) || [];
        const blob = new Blob([JSON.stringify(tasks, null, 2)], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'todo-list.json';
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
    }

    function clearCompletedTasks() {
        completedList.innerHTML = '';
        saveTasks();
    }

    function formatDateForDisplay(dateString) {
        if (!dateString) return '';
        try {
            const date = new Date(dateString);
            if (isNaN(date.getTime())) return '';
            return date.toLocaleDateString();
        } catch (error) {
            return '';
        }
    }

    function formatDateForInput(dateString) {
        if (!dateString) return '';
        try {
            const date = new Date(dateString);
            if (isNaN(date.getTime())) return '';
            return date.toISOString().split('T')[0];
        } catch (error) {
            return '';
        }
    }

    function isValidDate(dateString) {
        if (!dateString) return true; // Empty date is valid
        const date = new Date(dateString);
        return !isNaN(date.getTime());
    }

    function showMessage(message, type = 'info') {
        // Remove existing message
        const existingMessage = document.querySelector('.message');
        if (existingMessage) {
            existingMessage.remove();
        }

        // Create new message
        const messageDiv = document.createElement('div');
        messageDiv.className = `message message-${type}`;
        messageDiv.textContent = message;
        
        // Insert after the form
        const form = document.getElementById('todo-form');
        form.parentNode.insertBefore(messageDiv, form.nextSibling);
        
        // Auto-remove after 3 seconds
        setTimeout(() => {
            if (messageDiv.parentNode) {
                messageDiv.remove();
            }
        }, 3000);
    }
});

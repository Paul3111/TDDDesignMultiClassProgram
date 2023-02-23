{{DIARY}} Multi-Class Planned Design Recipe
1. Describe the Problem

  As a user, so that I can record my experiences
  I want to keep a regular diary

  As a user, so that I can reflect on my experiences
  I want to read my past diary entries

  As a user, so that I can reflect on my experiences in my busy day
  I want to select diary entries to read based on how much time I have and my reading speed

  As a user, so that I can keep track of my tasks
  I want to keep a todo list along with my diary

  As a user, so that I can keep track of my contacts
  I want to see a list of all of the mobile phone numbers in all my diary entries

The program will have three classes:

  PhoneBook.new
  PhoneBook.phonebook # => contact number as string added to list
  PhoneBook.view_contact(contact_name) # => returns a contact number and number
  PhoneBook.view_all_contacts # => returns all contacts in a list
  PhoneBook.delete_contact(contact_name) # => deletes a contact_number from the list

  ToDo.new
  ToDo.add_todo # => task added to list as string
  ToDo.view_todo(todo_text) # => returns a todo (searched by partial content string)
  ToDo.view_all_todos # => returns a list of all todos
  ToDo.delete_todo(todo_text) # => removes a todo (searches todo sub-string)

  Diary.new # initializes with two empty lists (one for Todos and one for contact numbers)
  Diary.add_todo # => adds a todo
  Diary.add_contact # => adds a contact name and number
  Diary.read_entry # => returns a diary_entry (search is done by key, using include?)
  Diary.read_chunk # => returns a chunk of the entire contents of the diary based on wpm * reading_time
  Diary.view_all_todos # => returns full contents of the todolist
  Diary.view_all_contact_numbers # => returns full contents of the phonebook
  Diary.view_all_contents # => returns full contents of diary
  Diary.delete_todo # => removes a todo
  Diary.delete_contact # => removes a contact

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything.
The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

Also design the interface of each class in more detail.

class Diary
  def initialize
    # starts with an empty array for todos
    # starts with an empty array for contacts
  end
  
  add_todo
    # adds a todo entry to list as text
  end
  
  add_contact(contact_number)
    # adds a contact name and number to list as text
  end
  
  def read_entry(search_string)
    # returns a specific diary_entry
  end
  
  def_read_chunk(wpm, reading_time)
    # returns a chunk of text that can be read in the given time
  end
  
  def view_all_todos
    # returns all todos
  end

  def view_all_contact_numbers
    # returns all contact_numbers
  end

  def view_all_contents
    # returns all contents
  end

  def delete_todo(todo_text)
    # Deletes a todo item
  end
  
  def delete_contact(contact_name)
    # Deletes a contact name and number
  end
end

class Todo
  def initialize
    todo_list = []
  end

  def add_todo(todo_owner, todo_text)
    # adds todo item to diary as hash
  end

  def view_todo(todo_text)
    # returns a todo item
  end
  
  def view_all_todos
    # returns a todo item
  end

  def delete_todo(todo_text)
    # deletes a todo from todo_list
  end
  
end

class PhoneBook
  def initialize
    contact_list = []
  end
  
  def add_to_phonebook(contact_name, contact_number)
    # adds contact name and number to contact_list
  end
  
  def view_contact(contact_name)
    # returns a contact number from contact_list
  end
  
  def view_all_contacts
    # returns all contact numbers
  end
  
  def delete_contact(contact_name)
    # removes a contact name and number from contact_list
  end

end

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations
and combinations that reflect the ways in which the system will be used.

######################### STILL TO DO ########################################

#phonebook spec - if contact number not 11 chars

#context - When at least one entry.
  # before do
  # end
# 1 - Adds a todo.
  first_diary = Diary.new
  task_1 = ToDo.new("Paul Lazar","Go shop!"
  task_1.add_to_diary # => # ["Paul Lazar","Go shop!"]
  
# 2 - Adds a contact person and number.
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  contact_1.add_to_phonebook # => ["Paul Lazar","07802465000"]

# 3 - Views all todo items.
  first_diary = Diary.new
  task_1 = ToDo.new("Paul Lazar","Go shop!")
  task_2 = ToDo.new("Mary Jane","Go to the gym!"
  first_diary.view_all_todos # => ["Paul Lazar","Go shop!", "Mary Jane","Go to the gym!]

# 4 - Views all contacts (name and number).
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  contact_2 = PhoneBook.new("Alice Jones","07802465001")
  first_diary.view_all_contacts # => ["Paul Lazar","07802465000", "Alice Jones","07802465001"]

# 6 - Views all diary contents.
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  task_1 = ToDo.new("Paul Lazar","Go shop!")
  first_diary.view_all_contents # => ["Paul Lazar","07802465000", "Paul Lazar","Go shop!"]

# 7 - Deletes one entry
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  contact_1.add_to_phonebook
  contact_2 = PhoneBook.new("Alice Jones","07802465001")
  contact_1.add_to_phonebook
  task_1 = ToDo.new("Paul Lazar","Go shop!")
  task_1.add_todo
  first_diary.delete_contact("Paul Lazar") 
  first_diary.view_all_contents # => ["Alice Jones","07802465001", "Paul Lazar","Go shop!""]

#context - When a search is performed.
# 1 - Returns a contact name and number.
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  contact_2 = PhoneBook.new("Alice Jones","07802465001")
  task_1 = ToDo.new("Paul Lazar","Go shop!")
  task_2 = ToDo.new("Mary Jane","Go to the gym!")
  first_diary.read_entry("Paul Lazar") # => ["Paul Lazar","07802465000", "Paul Lazar","Go shop!"]
  
# 2 - Returns a todo item.
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  contact_2 = PhoneBook.new("Alice Jones","07802465001")
  task_1 = ToDo.new("Paul Lazar","Go shop!")
  task_2 = ToDo.new("Mary Jane","Go to the gym!")
  first_diary.read_entry("Mary Jane") # => ["Mary Jane","Go to the gym!"]


# 3 - Returns a todo item and a contact name and number.
  first_diary = Diary.new
  contact_1 = PhoneBook.new("Paul Lazar","07802465000")
  contact_2 = PhoneBook.new("Mary Jane","07802465001")
  task_1 = ToDo.new("Paul Lazar","Go shop!")
  task_2 = ToDo.new("Mary Jane","Go to the gym!")
  first_diary.read_entry("Mary Jane") # => ["Mary Jane","07802465001", "Mary Jane", "Go to the gym!"]

#context - When no entries.
#1 Fails when deleting a diary entry that does not exist.
  first_diary = Diary.new
  first_diary.delete_diary_entry("Frank Sinatra") # => "You cannot delete what does not exist"

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class 
at a more granular level of detail.

# 1 - Adds a todo.
  todo_list1 = ToDo.new
  todo_list1.add_to_todo("Paul Lazar","Go shop!") # => # ["Paul Lazar","Go shop!"]

# 2 - Selects and returns a specific todo.
  todo_list1 = ToDo.new
  todo_list_1.add_todo("Paul Lazar", "Go study")
  todo_list_1.add_todo("Janice Jones", "Go shop")
  todo_list1.view_todo("Paul Lazar") # => # ["Paul Lazar","Go shop!"]

# 3 - Deletes a todo.
  todo_list1 = ToDo.new
  todo_list1.add_todo("Paul Lazar","Go shop!") # => # {"Paul Lazar","Go shop!"}
  todo_list2.add_todo("Paul Lazar","Go study!") # => # {"Paul Lazar","Go study!"}
  todo_list1.delete_todo("shop") # => deletes {"Paul Lazar","Go shop!"}
  todo_list1.view_todo("Go shop!") # => fails

# 4 - Adds a contact person and number.
  contact_1 = PhoneBook.new
  contact_1.add_to_phonebook("Paul Lazar","07802465000") # => {"Paul Lazar","07802465000"}

5. Implement the Behaviour
After each test you write, follow the test-driving process of 
red, green, refactor to implement the behaviour.
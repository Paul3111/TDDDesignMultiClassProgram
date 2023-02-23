require 'diary'
require 'todo'
require 'phonebook'

RSpec.describe "Diary Integration." do
  context "When at least one entry." do
    before do
    end
    
    it "Adds a todo." do
      first_diary = Diary.new
      task_1 = ToDo.new
      first_diary.add_todo(task_1.add_todo("Paul Lazar","Go shop!"))
      expect(first_diary.view_all_contents).to eq ["Paul Lazar - Go shop!"]
    end
    
    it "Adds a contact person and number." do
      first_diary = Diary.new
      contact_1 = PhoneBook.new
      first_diary.add_contact(contact_1.add_to_phonebook("Paul Lazar","07802465000"))
      expect(first_diary.view_all_contents).to eq ["Paul Lazar - 07802465000"]
    end
    
    it "Views all todo items." do
      first_diary = Diary.new
      task_1 = ToDo.new
      first_diary.add_todo(task_1.add_todo("Paul Lazar", "Go shop!"))
      task_2 = ToDo.new
      first_diary.add_todo(task_2.add_todo("Mary Jane", "Go to the gym!"))
      expect(first_diary.view_all_todos).to eq ["Paul Lazar - Go shop!", "Mary Jane - Go to the gym!"]
    end

    it "Returns all contacts (name and number)." do
      first_diary = Diary.new
      contact_1 = PhoneBook.new
      first_diary.add_contact(contact_1.add_to_phonebook("Paul Lazar", "07802465000"))
      contact_2 = PhoneBook.new
      first_diary.add_contact(contact_2.add_to_phonebook("Alice Jones", "07802465001"))
      expect(first_diary.view_all_contacts).to eq ["Paul Lazar - 07802465000", "Alice Jones - 07802465001"]
    end

    it "Views all diary contents." do
      first_diary = Diary.new
      contact_1 = PhoneBook.new
      first_diary.add_contact(contact_1.add_to_phonebook("Paul Lazar", "07802465000"))
      task_1 = ToDo.new
      first_diary.add_todo(task_1.add_todo("Paul Lazar", "Go shop!"))
      expect(first_diary.view_all_contents).to eq ["Paul Lazar - Go shop!", "Paul Lazar - 07802465000"]
    end
    
    it "Deletes one entry." do
      first_diary = Diary.new
      contact_1 = PhoneBook.new
      first_diary.add_contact(contact_1.add_to_phonebook("Paul Lazar", "07802465000"))
      contact_2 = PhoneBook.new
      first_diary.add_contact(contact_2.add_to_phonebook("Alice Jones","07802465001"))
      task_1 = ToDo.new
      first_diary.add_todo(task_1.add_todo("Paul Lazar","Go shop!"))
      first_diary.delete_contact("Paul Lazar")
      expect(first_diary.view_all_contents).to eq ["Paul Lazar - Go shop!", "Alice Jones - 07802465001"]
    end
  end

  context "When a search is performed." do
    it "Returns all entries that contain the search string." do
      first_diary = Diary.new
      contact_1 = PhoneBook.new
      first_diary.add_contact(contact_1.add_to_phonebook("Paul Lazar", "07802465000"))
      contact_2 = PhoneBook.new
      first_diary.add_contact(contact_2.add_to_phonebook("Alice Jones", "07802465001"))
      task_1 = ToDo.new
      first_diary.add_todo(task_1.add_todo("Paul Lazar", "Go shop!"))
      task_2 = ToDo.new
      first_diary.add_todo(task_2.add_todo("Mary Jane", "Go to the gym!"))
      expect(first_diary.read_entry("Paul Lazar")).to eq ["Paul Lazar - 07802465000", "Paul Lazar - Go shop!"]
    end
    
    it "Returns only the todo entries." do
      first_diary = Diary.new
      contact_1 = PhoneBook.new
      first_diary.add_contact(contact_1.add_to_phonebook("Paul Lazar", "07802465000"))
      contact_2 = PhoneBook.new
      first_diary.add_contact(contact_2.add_to_phonebook("Alice Jones", "07802465001"))
      task_1 = ToDo.new
      first_diary.add_todo(task_1.add_todo("Mary Jane", "Go shop!"))
      task_2 = ToDo.new
      first_diary.add_todo(task_2.add_todo("Mary Jane", "Go to the gym!"))
      expect(first_diary.view_all_todos).to eq ["Mary Jane - Go shop!", "Mary Jane - Go to the gym!"]
    end

    it "Returns a todo item and a contact name and number." do
      first_diary = Diary.new
      contact_1 = PhoneBook.new
      first_diary.add_contact(contact_1.add_to_phonebook("Sam Walker", "07802465000"))
      contact_2 = PhoneBook.new
      first_diary.add_contact(contact_2.add_to_phonebook("Mary Jane", "07802465001"))
      task_1 = ToDo.new
      first_diary.add_todo(task_1.add_todo("Paul Lazar", "Go shop!"))
      task_2 = ToDo.new
      first_diary.add_todo(task_2.add_todo("Mary Jane", "Go to the gym!"))
      expect(first_diary.read_entry("Mary Jane")).to eq ["Mary Jane - 07802465001", "Mary Jane - Go to the gym!"]
    end
  end
  
  context "When no entries." do
    it "Fails when deleting a diary entry that does not exist." do
      first_diary = Diary.new
      expect {first_diary.delete_contact("Frank Sinatra")}.to raise_error "You cannot delete what does not exist"
    end
  end
end
require 'todo'

RSpec.describe ToDo do

  it "Adds a todo." do
    todo_list_1 = ToDo.new
    expect(todo_list_1.add_todo("Paul Lazar", "Go shop")).to eq "Paul Lazar - Go shop"
  end
  
  it "Selects and returns a specific todo." do
    todo_list_1 = ToDo.new
    todo_list_1.add_todo("Paul Lazar", "Go study")
    todo_list_1.add_todo("Janice Jones", "Go shop")
    expect(todo_list_1.view_todo("Janice")).to eq "Janice Jones - Go shop"
  end
  
  it "Views all todos." do
    todo_list_1 = ToDo.new
    todo_list_1.add_todo("Paul Lazar","Go study")
    todo_list_1.add_todo("Janice Jones","Go shop")
    expect(todo_list_1.view_all_todos).to eq ["Paul Lazar - Go study", "Janice Jones - Go shop"]
  end
  
  it "Views all todos after one todo deleted." do
    todo_list_1 = ToDo.new
    todo_list_1.add_todo("Paul Lazar","Go study")
    todo_list_1.add_todo("Janice Jones","Go shop")
    todo_list_1.add_todo("Alex Smith","Take dog for a walk")
    todo_list_1.delete_todo("Paul Lazar")
    expect(todo_list_1.view_all_todos).to eq ["Janice Jones - Go shop", "Alex Smith - Take dog for a walk"]
  end
  
  context "When entry does not exist." do
    it "Fails." do
      todo_list_1 = ToDo.new
      todo_list_1.add_todo("Paul Lazar", "Go shop")
      expect { todo_list_1.delete_todo("gym") }.to raise_error "You cannot delete what does not exist"
    end
    
    it "Returns nil if user wants to view an entry that does not exist." do
      todo_list_1 = ToDo.new
      todo_list_1.add_todo("Paul Lazar", "Go shop")
      expect(todo_list_1.view_todo("gym")).to eq nil
    end
  end
end
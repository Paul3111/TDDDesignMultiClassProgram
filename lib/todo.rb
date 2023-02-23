class ToDo
  def initialize
    @todo_list = []
  end

  def add_todo(todo_owner, todo_text)
    @todo_list << "#{todo_owner} - #{todo_text}"
    # I have left the line above here so the ToDo class can also work independently
    return todo_entry = "#{todo_owner} - #{todo_text}"
  end

  def view_todo(todo_text)
    @todo_list.find { |todo| todo.include?(todo_text)}
  end
  
  def view_all_todos
    @todo_list
  end

  def delete_todo(todo_text)
    if @todo_list.find { |todo| todo.include?(todo_text)}
      @todo_list.delete(@todo_list.find { |todo| todo.include?(todo_text)})
    else
      fail "You cannot delete what does not exist"
    end
  end
  
end
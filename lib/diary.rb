class Diary
  def initialize
    @todo_list = []
    @contact_list = []
  end
  
  def add_todo(todo)
    @todo_list << todo
  end
  
  def add_contact(contact)
    @contact_list << contact
  end

  def read_entry(search_string)
    todo_result = @todo_list.select { |entry| entry.include?(search_string)}
    contact_result = @contact_list.select { |entry| entry.include?(search_string)}
    return result = contact_result + todo_result
  end
  
  def read_chunk(wpm, reading_time)
    words_that_can_be_read = wpm * reading_time
    text = (@contact_list + @todo_list).join(" ").split()
    return chunk = [text[0 ... words_that_can_be_read].join(" ")]
  end
  
  def view_all_todos
    @todo_list
  end

  def view_all_contacts
    @contact_list
  end

  def view_all_contents
    @todo_list + @contact_list
  end

  def delete_todo(todo_text)
    if @todo_list.find { |todo| todo.include?(todo_text)}
      @todo_list.delete(@todo_list.find { |todo| todo.include?(todo_text)})
    else
      fail "You cannot delete what does not exist"
    end
  end
  
  def delete_contact(contact_name)
    if  @contact_list.find { |name| name.include?(contact_name)}
      @contact_list.delete(@contact_list.find { |name| name.include?(contact_name)})
    else
      fail "You cannot delete what does not exist"
    end
  end
  
end
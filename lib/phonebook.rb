class PhoneBook
  def initialize
    @contact_list = []
  end

  def add_to_phonebook(contact_name, contact_number)
    @contact_list << "#{contact_name} - #{contact_number}"
    # I have left the line above here so the PhoneBook class can also work independently
    return contact = "#{contact_name} - #{contact_number}"
  end
  
  def view_contact(contact_name)
    @contact_list.find { |name| name.include?(contact_name)}
  end
  
  def view_all_contacts
    @contact_list
  end
  
  def delete_contact(contact_name)
    if  @contact_list.find { |name| name.include?(contact_name)}
    @contact_list.delete(@contact_list.find { |name| name.include?(contact_name)})
    else
      fail "You cannot delete what does not exist"
    end
  end
end
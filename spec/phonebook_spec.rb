require 'phonebook'

RSpec.describe PhoneBook do
  before do
    @list_1 = PhoneBook.new
  end
  it "Adds a contact person and number." do
    expect(@list_1.add_to_phonebook("Paul Lazar","07802465000")).to eq "Paul Lazar - 07802465000"
  end
  
  it "Selects and returns a specific contact name and number." do
    @list_1.add_to_phonebook("Paul Lazar","07802465000")
    @list_1.add_to_phonebook("Janice Jones","07802465002")
    expect(@list_1.view_contact("Janice")).to eq "Janice Jones - 07802465002"
  end
  
  it "Views all contacts." do
    @list_1.add_to_phonebook("Paul Lazar","07802465000")
    @list_1.add_to_phonebook("Janice Jones","07802465002")
    expect(@list_1.view_all_contacts).to eq ["Paul Lazar - 07802465000", "Janice Jones - 07802465002"]
  end
  
  it "Views all remaining contacts after one contact deleted." do
    @list_1.add_to_phonebook("Paul Lazar","07802465000")
    @list_1.add_to_phonebook("Janice Jones","07802465002")
    @list_1.add_to_phonebook("Alex Smith","07802465003")
    @list_1.delete_contact("Paul Lazar")
    expect(@list_1.view_all_contacts).to eq ["Janice Jones - 07802465002", "Alex Smith - 07802465003"]
  end
  
  context "When entry does not exist" do
    it "Fails." do
      list_1 = PhoneBook.new
      list_1.add_to_phonebook("Paul Lazar", "07802465000")
      expect { list_1.delete_contact("Janice Jones") }.to raise_error "You cannot delete what does not exist"
    end
    
    it "Returns nil if user wants to view an entry that does not exist" do
      list_1 = PhoneBook.new
      list_1.add_to_phonebook("Paul Lazar", "07802465000")
      expect(list_1.view_contact("Janice")).to eq nil
    end
  end
end
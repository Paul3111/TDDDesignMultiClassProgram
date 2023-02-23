require 'diary'

RSpec.describe Diary do
  before do
    @diary_1 = Diary.new
  end
  it "Adds one todo in diary and returns it." do
    @diary_1.add_todo("Paul Lazar - Go to the shop")
    expect(@diary_1.view_all_todos).to eq ["Paul Lazar - Go to the shop"]
  end
  
  it "Adds one contact in diary and returns it." do
    @diary_1.add_contact("Paul Lazar - 07802465000")
    expect(@diary_1.view_all_contacts).to eq ["Paul Lazar - 07802465000"]
  end
  
  it "Returns all diary entries." do
    @diary_1.add_todo("Paul Lazar - Go to the shop")
    @diary_1.add_todo("Alex Walker - Go to the gym")
    @diary_1.add_contact("Janice Smith - 07802465004")
    expect(@diary_1.view_all_contents).to eq ["Paul Lazar - Go to the shop", "Alex Walker - Go to the gym", "Janice Smith - 07802465004"]
  end
  
  it "Deletes one todo and returns the remaining ones." do
    @diary_1.add_todo("Paul Lazar - Go to the shop")
    @diary_1.add_todo("Alex Smith - Go to the gym")
    @diary_1.add_todo("Paul Lazar - Start to study")
    @diary_1.delete_todo("shop")
    expect(@diary_1.view_all_todos).to eq ["Alex Smith - Go to the gym", "Paul Lazar - Start to study"]
  end
  
  it "Deletes one contact and returns the remaining ones." do
    @diary_1.add_contact("Paul Lazar - 07802465000")
    @diary_1.add_contact("Janice Smith - 07802465002")
    @diary_1.add_contact("Alicia Walker - 07802465003")
    @diary_1.delete_contact("Janice Smith")
    expect(@diary_1.view_all_contacts).to eq ["Paul Lazar - 07802465000", "Alicia Walker - 07802465003"]
  end
  
 it "Returns all entries that match the search string." do
    @diary_1.add_contact("Paul Lazar - 07802465000")
    @diary_1.add_contact("Alicia Walker - 07802465003")
    @diary_1.add_todo("Paul Lazar - Go to the gym")
    expect(@diary_1.read_entry("Paul Lazar")).to eq ["Paul Lazar - 07802465000", "Paul Lazar - Go to the gym"]
  end
  
  it "Returns a reading chunk to be read." do
    @diary_1.add_contact("Paul Lazar - 07802465000")
    @diary_1.add_contact("Alicia Walker - 07802465003")
    @diary_1.add_todo("Paul Lazar - Go to the gym")
    result = @diary_1.read_chunk(1, 9)
    expect(result).to eq ["Paul Lazar - 07802465000 Alicia Walker - 07802465003 Paul"]
  end

  context "When an entry is missing." do
    it "Fails" do
      @diary_1.add_todo("Paul Lazar - Go to the shop")
      @diary_1.add_todo("Alex Smith - Go to the gym")
      @diary_1.add_todo("Paul Lazar - Start to study")
      @diary_1.delete_todo("shop")
      expect { @diary_1.delete_todo("shop") }.to raise_error "You cannot delete what does not exist"
    end
    
    it "Returns nil if user wants to view an entry that does not exist." do
      @diary_1.add_contact("Paul Lazar - 07802465000")
      @diary_1.delete_contact("Paul Lazar")
      expect(@diary_1.view_all_contacts).to eq []
    end
  end

end
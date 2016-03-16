require "rails_helper"

RSpec.feature "Searching for users" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "password")
    @jane = User.create(first_name: "Jane", last_name: "Doe", email: "janedoe@example.com", password: "password")
  end
  
  scenario "with existing name" do
    visit "/"
    
    fill_in "search_name", with: "Doe"
    click_button "Search"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@jane.full_name)
    expect(current_path).to eq("/dashboard/search")
  end
    
end
  
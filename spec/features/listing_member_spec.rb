require "rails_helper"

RSpec.feature "Listing Members" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "password")
    @jane = User.create(first_name: "Jane", last_name: "Doh", email: "janedoh@example.com", password: "password")
  end
  
  scenario "shows list of members" do
    visit "/"
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@jane.full_name)
  end
  
end
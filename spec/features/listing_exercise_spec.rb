require "rails_helper"

RSpec.feature "Listing Exercises" do
  
  before do
    @john =User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    login_as(@john)
    @jane =User.create(first_name: "Jane", last_name: "Doh", email: "jane@example.com", password: "password")
    
    
    @e1 =@john.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: Date.today)
    @e2 =@john.exercises.create(duration_in_min: 30, workout: "running", workout_date: Date.today)
    
    @following = Friendship.create(user: @john, friend: @jane)

  end
  
  scenario "show last seven days of workouts" do
    visit "/"
    click_link "My Lounge"
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
        
  end
  
  scenario "shows users freinds" do
    visit "/"
    click_link "My Lounge"
    
    expect(page).to have_content("My Friends")
    expect(page).to have_content(@jane.full_name)
    expect(page).to have_content("Unfollow")
  end
  
  
end

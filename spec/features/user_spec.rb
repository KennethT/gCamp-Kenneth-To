require 'rails_helper'

describe 'User can CRUD users' do

  scenario 'User can create a user' do
    visit '/'
    click_on "Sign Up"

    fill_in 'user[first_name]', :with => "Joe"
    fill_in 'user[last_name]', :with => "Example"
    fill_in 'user[email]', :with => "joe@example.com"
    fill_in 'user[password]', :with => "password"
    fill_in 'user[password_confirmation]', :with => "password"

    within('form') do
    click_on "Sign Up"
    end

    expect(page).to have_content("User was successfully created.")

  end

  scenario 'User can read and edit a user' do
    visit '/'
    click_on "Sign Up"

    fill_in 'user[first_name]', :with => "Joe"
    fill_in 'user[last_name]', :with => "Example"
    fill_in 'user[email]', :with => "joe@example.com"
    fill_in 'user[password]', :with => "password"
    fill_in 'user[password_confirmation]', :with => "password"

    within('form') do
    click_on "Sign Up"
    end

    click_on "Users"
    click_on "Edit"

    fill_in 'user[first_name]', :with => "Monkey"
    fill_in 'user[last_name]', :with => "Cat"

    click_on "Sign Up"

    expect(page).to have_content("Monkey")
    expect(page).to have_content("Cat")

  end

  scenario 'User can delete a user' do
    visit '/'
    click_on "Sign Up"

    fill_in 'user[first_name]', :with => "Joe"
    fill_in 'user[last_name]', :with => "Example"
    fill_in 'user[email]', :with => "joe@example.com"
    fill_in 'user[password]', :with => "password"
    fill_in 'user[password_confirmation]', :with => "password"

    within('form') do
    click_on "Sign Up"
    end
    visit '/users'
    click_on "Delete"

    #after deleting yourself, you can't see the traditional error message
    #so you see error message for being logged in instead since the user no longer exists
    expect(page).to have_content("You need to be logged in to see this.")

  end

end

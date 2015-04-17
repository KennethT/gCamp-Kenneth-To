require 'rails_helper'

describe 'Admin can CRUD everything of other users' do

  scenario 'Admin can edit a project of another user' do
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
    visit '/projects/new'
    fill_in 'project[name]', :with => "power"
    click_on "Create Project"
    click_on "Sign out"

    visit '/login'
    fill_in 'email', :with => "admin@example.com"
    fill_in 'password', :with => "password"
    click_on "Login!"
    visit "/users/"
    click_on "power"
    click_on "Edit"
    fill_in 'project[name]', :with => "ranger"
    click_on "Update Project"
    expect(page).to have_content("Project was successfully updated.")

  end

  scenario 'Admin can edit a project of another user' do
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
    visit '/projects/new'
    fill_in 'project[name]', :with => "power"
    click_on "Create Project"
    click_on "Sign out"

    visit '/login'
    fill_in 'email', :with => "admin@example.com"
    fill_in 'password', :with => "password"
    click_on "Login!"
    visit "/users/"
    click_on "power"
    click_on "Edit"
    click_on "Delete"
    expect(page).to have_content("Project was successfully destroyed")

  end

end

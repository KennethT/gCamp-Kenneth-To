require 'rails_helper'

describe 'User can CRUD projects' do

  scenario 'User can create a project' do
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
    expect(page).to have_content("Project was successfully created.")

  end

  scenario 'User can read and edit a project' do
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
    visit "/projects/"
    click_on "power"
    click_on "Edit"
    fill_in 'project[name]', :with => "ranger"
    click_on "Update Project"
    expect(page).to have_content("Project was successfully updated.")


  end

end

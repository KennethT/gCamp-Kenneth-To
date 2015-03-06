require 'rails_helper'

describe 'User can signup, signout and signin' do

  scenario 'User can signup' do
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

  scenario 'User can signout' do
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
    click_on "Sign out"
    expect(page).to have_content("Bye!")

  end

  scenario 'User can signin' do
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
    click_on "Sign out"
    click_on "Sign in"
    fill_in 'email', :with => "joe@example.com"
    fill_in 'password', :with => "password"
    click_on "Login!"
    expect(page).to have_content("Welcome back!")

  end


end

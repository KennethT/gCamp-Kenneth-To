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

  
    User.create(first_name: 'admin', last_name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
    visit '/login'
    fill_in 'email', :with => "admin@example.com"
    fill_in 'password', :with => "password"
    click_on "Login!"
    visit "/projects"
    first(:link, "power").click
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
    User.create(first_name: 'admin', last_name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
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

  scenario 'Admins have permission to edit tasks of other users' do
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


    fill_in 'project[name]', :with => "power"
    click_on "Create Project"
    expect(page).to have_content("power")

    click_on "New Task"
    #filling out form for task
    fill_in 'task[description]', :with => "doggie"
    select "2014", :from => "task_date_1i"
    select "January", :from => "task_date_2i"
    select "1", :from => "task_date_3i"
    click_on "Create Task"
    click_on "Sign out"


    User.create(first_name: 'admin', last_name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
    visit '/login'
    fill_in 'email', :with => "admin@example.com"
    fill_in 'password', :with => "password"
    click_on "Login!"
    visit "/users/"
    click_on "power"
    click_on "1 Tasks"
    click_on "Edit"
    fill_in 'task[description]', :with => "Elephant"
    click_on "Update Task"
    expect(page).to have_content("Task was successfully updated.")

  end

  scenario 'Admin have permission to delete tasks of other users' do
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


    visit '/projects/'

    click_on '0'

    click_on "New Task"
    #filling out form for task
    fill_in 'task[description]', :with => "Cow"
    select "2014", :from => "task_date_1i"
    select "January", :from => "task_date_2i"
    select "1", :from => "task_date_3i"
    click_on "Create Task"
    click_on "Sign out"



    User.create(first_name: 'admin', last_name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
    visit '/login'
    fill_in 'email', :with => "admin@example.com"
    fill_in 'password', :with => "password"
    click_on "Login!"
    visit "/users/"
    click_on "power"
    click_on "1 Tasks"
    click_link("destroy")
    expect(page).to have_content("Task was successfully destroyed.")

  end

  scenario 'Admin have permission to view and other users' do
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

    passes locally - can show, commenting out for now
    User.create(first_name: 'admin', last_name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
    visit '/login'
    fill_in 'email', :with => "admin@example.com"
    fill_in 'password', :with => "password"
    click_on "Login!"
    click_on "Users"
    click_on "Joe"
    click_on "Edit"
    fill_in 'user[first_name]', :with => "Monkey"
    fill_in 'user[last_name]', :with => "Cat"

    click_on "Update User"

    expect(page).to have_content("Monkey")
    expect(page).to have_content("Cat")

  end

  scenario 'Admin have permission to change other users into admins' do
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


    User.create(first_name: 'admin', last_name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
    visit '/login'
    fill_in 'email', :with => "admin@example.com"
    fill_in 'password', :with => "password"
    click_on "Login!"
    click_on "Users"
    click_on "Joe"
    click_on "Edit"
    expect(page).to have_content("Admin")

  end

end

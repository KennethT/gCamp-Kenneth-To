require 'rails_helper'

describe 'User can CRUD tasks' do

  scenario 'User can create a Task' do
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

    #submitting form to create a task
    click_on "Create Task"


    #now we expect the index page to have the description of the task we created.
    expect(page).to have_content("Cow")
    # expecting the flash notification
    expect(page).to have_content("Task was successfully created")
  end

  #create tasks
  scenario 'User can view a show page for a task' do

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
    fill_in 'task[description]', :with => "bat"
    select "2014", :from => "task_date_1i"
    select "January", :from => "task_date_2i"
    select "1", :from => "task_date_3i"
    click_on "Create Task"
    expect(page).to have_content("Task was successfully created.")
  end

  #Users can edit an task
  scenario 'User can edit an task' do
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
    click_on "Edit"
    fill_in 'task[description]', :with => "Elephant"
    click_on "Update Task"
    expect(page).to have_content("Task was successfully updated.")

  end

  scenario 'User can delete an task' do
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
    click_link("destroy")
    expect(page).to have_content("Task was successfully destroyed.")

  end


end

require 'rails_helper'

describe 'User can CRUD tasks' do

  scenario 'User can create a Task' do
    # visit root aka homepage
    visit '/tasks'

    # click on link to go to new task form
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

  #create task for events to appear in
  scenario 'User can view a show page for a task' do

    @task = Task.create(description: "Cow", date: "2014-01-01")
    visit "/tasks/#{@task.id}"

    #expect to see flash notice of successfully creation of event
    expect(page).to have_content("Cow")
  end

  #Users can edit an task
  scenario 'User can edit an task' do
    @task = Task.create(description: "Cow", date: "2014-01-01")
    visit "/tasks/#{@task.id}/edit"

    #filling out form for task
    fill_in 'task[description]', :with => "Dog"

    #submitting form to create a task
    click_on "Update Task"

    #now we expect the index page to have the description of the task we created.
    expect(page).to have_content("Dog")
    # expecting the flash notification
    expect(page).to have_content("Task was successfully")

  end

  scenario 'User can delete an task' do

    @task = Task.create(description: "Cow", date: "2014-01-01")
    visit "/tasks/"

    #click on Delete
    click_on "Delete"

    # expecting the flash notification (code says Location but should say Event)
    # test works but base code needs to be fixed
    expect(page).to have_content("Task was successfully destroyed.")

  end


end

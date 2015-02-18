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

end

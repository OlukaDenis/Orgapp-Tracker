require 'rails_helper'

RSpec.feature 'Project: ', type: :feature do
  before(:all) do
    @user = create(:user)
  end

  scenario 'Add new project without a group' do
    login
    click_on 'My Projects'
    click_on 'New Project'
    project = @user.author_projects.build(name: 'Test project', duration: 5)
    add_project(project)
    expect(page).to have_content('Project was successfully created')
  end

  scenario 'add new project with a group' do
    login
    click_on 'All Groups'
    click_on 'New Group'
    add_group
    click_on 'My Projects'
    click_on 'New Project'
    project = @user.author_projects.build(name: 'Orgapp', duration: 2)
    fill_in 'name', with: project.name
    fill_in 'duration', with: project.duration
    select 'Test Group', from: 'project_groups'
    click_button 'Save Project'
    expect(page).to have_content('2 hours')
  end

  def add_project(project)
    fill_in 'name', with: project.name
    fill_in 'duration', with: project.duration
    click_button 'Save Project'
  end

  def add_group
    group = @user.author_groups.build(name: 'Test Group',
                                      icon: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/rails.png'))))
    fill_in 'name', with: group.name
    attach_file('group[icon]',
                File.join(Rails.root, '/spec/fixtures/images/rails.png'), visible: false)
    click_button 'Save Group'
  end

  def login
    visit signin_path
    fill_in 'login', with: @user.name
    click_button 'Signin'
    expect(page).to have_content('mcdenny')
  end
end

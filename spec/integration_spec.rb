require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
#require("spec_helper")

describe('adding a new list', {:type => :feature}) do
	it('allows a user to click a list to see the tasks and details for it') do
		visit('/')
		click_link('Add New List')
		fill_in('name', :with => 'epicodus work')
		click_button('Add List')
		expect(page).to have_content('Success!')
	end
	
end

describe('viewing all of the lists', {:type => :feature}) do
	it('allows a user to see all of the lists that have been created') do
		list = List.new({:description => 'epicodus homework', :id => nil})
		list.save()
		visit('/')
		click_link('View All Lists')
		expect(page).to have_content(list.description)
	end
end

describe('seeing details for a single list', {:type => :feature}) do
	it('allows a user to click a lost to see the tasks and details for it') do
		test_list = List.new({:description => 'school stuff'})
		test_list.save()
		test_task = Task.new({:description => "learn SQL", :list_id => test_list.id()})
		test_task.save()
		visit('/lists')
		click_link(test_list.description())
		expect(page).to have_content(test_task.description())
	end
end

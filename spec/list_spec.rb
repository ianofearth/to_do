# require('rspec')  #this functionality is now in spec_helper.rb
# require('pg')
# require('list')

# DB = PG.connect({:dbname => 'to_do_test'})

# RSpec.configure do |config|
# 	config.after(:each) do 
# 		DB.exec("DELETE FROM lists *;")
# 	end
# end

require("spec_helper")

describe(List) do

	describe("#name") do
		it("tells you the name") do
			list = List.new({:name => "epicodus stuff", :id => nil})
			expect(list.name()).to(eq("epicodus stuff"))
		end
	end

	describe(".all") do
		it("starts off with no lists") do
			expect(List.all()).to(eq([]))
		end
	end

	describe("#save") do
		it("lets you save lists to the database") do
			list = List.new({:name => "epicodus stuff", :id => nil})
			list.save()
			expect(List.all()).to(eq([list]))
		end
	end

	describe("#==") do
		it("is the same list if it has the same name") do
			list1 = List.new({:name => "epicodus stuff", :id => nil})
			list2 = List.new({:name => "epicodus stuff", :id => nil})
			expect(list1).to(eq(list2))
		end
	end

	describe(".find") do
		it("returns a list by its ID") do
			test_list = List.new({:name => "epicodus stuff", :id => nil})
			test_list.save()
			test_list2 = List.new({:name => "home stuff", :id => nil})
			test_list2.save()
			expect(List.find(test_list2.id())).to(eq(test_list2))
		end
	end

	describe("#tasks") do
		it("returns an array of tasks for that list") do
			test_list = List.new({:name => "epicodus stuff", :id => nil})
			test_list.save()
			test_task = Task.new({:description => "learn SQL", :list_id => test_list.id()})
			test_task.save()
			test_task2 = Task.new({:description => "review ruby", :list_id => test_list.id()})
			test_task2.save()
			expect(test_list.tasks()).to(eq([test_task, test_task2]))
		end
	end



end

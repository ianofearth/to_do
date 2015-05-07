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

	describe("#description") do
		it("tells you the description") do
			list = List.new({:description => "epicodus stuff", :id => nil})
			expect(list.description()).to(eq("epicodus stuff"))
		end
	end

	describe(".all") do
		it("starts off with no lists") do
			expect(List.all()).to(eq([]))
		end
	end

	describe("#save") do
		it("lets you save lists to the database") do
			list = List.new({:description => "epicodus stuff", :id => nil})
			list.save()
			expect(List.all()).to(eq([list]))
		end
	end

	describe("#==") do
		it("is the same list if it has the same description") do
			list1 = List.new({:description => "epicodus stuff", :id => nil})
			list2 = List.new({:description => "epicodus stuff", :id => nil})
			expect(list1).to(eq(list2))
		end
	end

	describe(".find") do
		it("returns a list by its ID") do
			test_list = List.new({:description => "epicodus stuff", :id => nil})
			test_list.save()
			test_list2 = List.new({:description => "home stuff", :id => nil})
			test_list2.save()
			expect(List.find(test_list2.id())).to(eq(test_list2))
		end
	end


end

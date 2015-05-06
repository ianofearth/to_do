require('rspec')
require('pg')
require('list')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
	config.after(:each) do 
		DB.exec("DELETE FROM lists *;")
	end
end

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
			list = List.new({:description = "epicodus stuff", :id => nil})
			list.save()
			expect(List.all()).to eq([list])
		end
	end




end

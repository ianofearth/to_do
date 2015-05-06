class List
	attr_reader(:description, :id)

	define_method(:initialize) do |attributes|
		@description = attributes.fetch(:description)
		@id = attributes.fetch(:id)
	end

	define_singleton_method(:all) do
		returned_lists = DB.exec("SELECT * FROM lists;")
		lists = []
		returned_lists.each() do |list|
			description = list.fetch("description")
			id = list.fetch("id").to_i
			lists.push(List.new({:description => description, :id => id}))
		end
		lists
	end



end
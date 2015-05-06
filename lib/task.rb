class Task
	attr_reader(:description, :list_id)

	define_method(:initialize) do |attributes|
		@description = attributes.fetch(:description)
		@list_id = attributes.fetch(:list_id)
	end


# define_method(:==) do |another_task|
	# 	self.description().==(another_task.description())
	# end

end
class Task
	# define_method(:==) do |another_task|
	# 	self.description().==(another_task.description())
	# end
	
	@@all_tasks = []

	define_method(:initialize) do |description|
		@description = description
	end

	define_method(:description) do
		@description
	end




end
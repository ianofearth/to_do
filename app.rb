# require('sinatra')
# require('sinatra/reloader')
# require('./lib/task')
# require('./lib/list')
# also_reload('lib/**/*.rb')
# require('pg')

# #DB = PG.connect({:dbname => "to_do"}) #for use
# DB = PG.connect({:dbname => "to_do_test"}) #for testing

# get("/") do
# 	erb(:index)
# end

# get("/lists/new") do
# 	erb(:list_form)
# end

# post("/lists") do
# 	description = params.fetch("description")
# 	list = List.new({:description => description, :id => nil})
# 	list.save()
# 	erb(:list_success)
# end

# get("/lists") do
# 	@lists = List.all()
# 	erb(:lists)
# end

# get("/lists/:id") do
# 	@list = List.find(params.fetch("id").to_i())
# 	erb(:list)
# end

# post("/tasks") do
# 	description = params.fetch("description")
# 	list_id = params.fetch("list_id").to_i()
# 	task = Task.new({:description => description, :list_id => list_id})
# 	task.save()
# 	erb(:success)
# end
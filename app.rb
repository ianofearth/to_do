require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "to_do"})

get("/") do
	erb(:index)
end

get("/lists/new") do
	erb(:list_form)
end

get("/lists") do
	name = params.fetch("name")
	list = List.new({:description => name, :id => nil})
	list.save()
	erb(:list_success)
end

get("/lists") do
	@lists = List.all()
	erb(:lists)
end

get("/lists/:id") do
	@list = List.find(params.fetch("id").to_i())
	erb(:list)
end
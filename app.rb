require 'sinatra/activerecord'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require './lib/division'
require './lib/employee'
also_reload 'lib/**/*.rb'
require 'pry'

get '/' do
  @divisions = Division.all
  erb :index
end

post '/division/new' do
  name = params[:division]
  Division.create({name: name})
  @divisions = Division.all
  erb :index
end

get '/divisions/:id' do
  @division = Division.find(params[:id].to_i)
  @employees = @division.employees
  erb :division
end

get '/division/:id/edit' do
  @division = Division.find(params[:id])
  erb :division_edit
end

patch '/division/:id' do
  @division = Division.find(params[:id].to_i)
  name = params[:name]
  @division.update({name: name})
  @employees = @division.employees
  erb :division
end

post '/employees/new/' do
  division_id = params[:id_division].to_i
  @division = Division.find(division_id)
  name = params[:name]
  Employee.create({name: name, division_id: @division.id})
  @employees = @division.employees
  erb :division
end

get '/employees/:id' do
  @employee = Employee.find(params[:id].to_i)
  erb :employee
end

get '/method' do
  Division.all.each {|division| division.destroy}
  Employee.all.each {|employee| employee.destroy}
  redirect '/'
end

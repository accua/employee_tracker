ENV['RACK_ENV'] = 'test'

require 'pg'
require 'rspec'
require 'sinatra'
require 'sinatra/activerecord'
require 'employee'
require 'division'

RSpec.configure do |config|
  config.after(:each) do
    Division.all.each { |division| division.destroy }
    Employee.all.each { |employee| employee.destroy }
  end
end

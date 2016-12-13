require 'spec_helper'

describe Division do
  describe '#employees' do
    it "will list the employees in the division" do
      new_division = Division.create(name: 'IT')
      new_employee = Employee.create(name: 'Andrew', division_id: new_division.id)
      expect(new_division.employees).to eq [new_employee]
    end
  end
end

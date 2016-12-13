require 'spec_helper'

describe Employee do
  describe '#division' do
    it "will list the division that the employee belongs too" do
      new_division = Division.create({name: 'IT'})
      new_employee = Employee.create({name: 'Ryan', division_id: new_division.id})
      expect(new_employee.division).to eq new_division
    end
  end
end

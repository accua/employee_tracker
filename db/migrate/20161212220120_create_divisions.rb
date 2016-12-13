class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table(:divisions) do |d|
      d.column(:name, :string)

      d.timestamps()
    end
  end
end

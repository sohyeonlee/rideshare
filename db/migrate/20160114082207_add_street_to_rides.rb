class AddStreetToRides < ActiveRecord::Migration
  def change
    add_column :rides, :street, :string
  end
end

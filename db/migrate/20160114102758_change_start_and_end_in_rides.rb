class ChangeStartAndEndInRides < ActiveRecord::Migration
  def change
    change_table :rides do |t|
      t.rename :start, :start_point
      t.rename :end, :end_point
    end
  end
end

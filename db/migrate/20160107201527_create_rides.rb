class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :start
      t.string :end
      t.string :time
      t.string :comment
      t.string :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

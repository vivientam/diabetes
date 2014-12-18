class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :user_id
      t.integer :sugar_level
      t.integer :weight
      
      t.timestamps
    end
  end
end

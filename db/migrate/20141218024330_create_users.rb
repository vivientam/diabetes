class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :title
      t.string :hospital
      t.string :dob
      t.boolean :is_doctor
      
      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :reading_id
      t.string :content
      t.boolean :read_by_patient
      
      t.timestamps
    end
  end
end

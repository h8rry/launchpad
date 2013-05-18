class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :name
      t.string :email
      t.string :type
      t.integer :type_id

      t.timestamps
    end
  end
end

class CreateFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :health
      t.integer :strength
      t.integer :experience
      t.integer :level
      t.integer :available_upgrade

      t.timestamps
    end
  end
end

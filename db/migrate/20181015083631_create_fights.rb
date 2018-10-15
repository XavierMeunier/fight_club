class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.integer :winner_punches
      t.integer :looser_punches
      t.string :victory_type
      t.integer :rounds
      t.references :winner, foreign_key: true, index: true
      t.references :looser, foreign_key: true, index: true

      t.timestamps
    end
  end
end

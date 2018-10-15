class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.integer :winner_punches
      t.integer :looser_punches
      t.integer :victory_type
      t.integer :rounds
      t.references :winner, foreign_key: false, index: true
      t.references :looser, foreign_key: false, index: true

      t.timestamps
    end
  end
end

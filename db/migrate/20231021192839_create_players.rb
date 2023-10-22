class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :rerolls, default: 0
      t.belongs_to :game, foreign_key: true

      t.timestamps
    end
  end
end

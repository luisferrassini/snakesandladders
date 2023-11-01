class CreateRolls < ActiveRecord::Migration[7.1]
  def change
    create_table :rolls do |t|
      t.integer :value
      t.boolean :special, default: false
      t.belongs_to :player, foreign_key: true

      t.timestamps
    end
  end
end

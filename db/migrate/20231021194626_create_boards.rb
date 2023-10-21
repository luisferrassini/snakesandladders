class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :description
      t.string :image
      t.belongs_to :game

      t.timestamps
    end
  end
end

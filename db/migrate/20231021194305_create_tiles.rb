class CreateTiles < ActiveRecord::Migration[7.1]
  def change
    create_table :tiles do |t|
      t.integer :number
      t.string :title
      t.text :description
      t.string :image
      t.belongs_to :board

      t.timestamps
    end
  end
end

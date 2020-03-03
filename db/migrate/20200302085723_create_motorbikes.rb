class CreateMotorbikes < ActiveRecord::Migration[5.2]
  def change
    create_table :motorbikes do |t|
      t.string :name
      t.string :make
      t.string :model
      t.integer :year
      t.text :description
      t.string :address
      t.integer :price
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

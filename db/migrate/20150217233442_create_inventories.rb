class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :count
      t.references :library, index: true
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :inventories, :libraries
    add_foreign_key :inventories, :books
  end
end

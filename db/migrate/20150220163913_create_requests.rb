class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :book, index: true
      t.references :library, index: true

      t.timestamps null: false
    end
    add_foreign_key :requests, :books
    add_foreign_key :requests, :libraries
  end
end

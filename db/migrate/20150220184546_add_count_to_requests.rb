class AddCountToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :count, :integer
  end
end

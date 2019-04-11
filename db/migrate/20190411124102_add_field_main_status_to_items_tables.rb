class AddFieldMainStatusToItemsTables < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :main_status, :boolean
  end
end

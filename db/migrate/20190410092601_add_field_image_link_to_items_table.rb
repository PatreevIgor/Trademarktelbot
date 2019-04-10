class AddFieldImageLinkToItemsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :image_link, :string
  end
end

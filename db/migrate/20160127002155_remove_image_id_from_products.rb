class RemoveImageIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image_id, :string
  end
end

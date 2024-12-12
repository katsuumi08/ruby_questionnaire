class AddItemIdToFreeTexts < ActiveRecord::Migration[7.1]
  def change
    add_column :free_texts, :item_id, :integer
    add_foreign_key :free_texts, :items
  end
end

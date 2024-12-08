class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :votes
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end

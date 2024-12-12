class CreateFreeTexts < ActiveRecord::Migration[7.1]
  def change
    create_table :free_texts do |t|
      t.references :survey, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end

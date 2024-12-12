class AddFreeTitleToSurveys < ActiveRecord::Migration[7.1]
  def change
    add_column :surveys, :free_text_title, :string
  end
end

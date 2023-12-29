class AddContentToHomePages < ActiveRecord::Migration[7.1]
  def change
    add_column :home_pages, :content, :text
  end
end

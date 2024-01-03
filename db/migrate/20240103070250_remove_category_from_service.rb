class RemoveCategoryFromService < ActiveRecord::Migration[7.1]
  def change
    remove_column :services, :category, :integer
  end
end

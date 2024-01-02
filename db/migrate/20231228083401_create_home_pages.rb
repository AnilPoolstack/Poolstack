class CreateHomePages < ActiveRecord::Migration[7.1]
  def change
    create_table :home_pages do |t|
      t.string :company_name

      t.timestamps
    end
  end
end

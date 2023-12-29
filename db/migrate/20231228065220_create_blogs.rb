class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :company_name
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

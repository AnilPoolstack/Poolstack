class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :service_name
      t.text :service_description
      t.integer :category

      t.timestamps
    end
  end
end

class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :email
      t.text :message
      t.integer :contact_number

      t.timestamps
    end
  end
end

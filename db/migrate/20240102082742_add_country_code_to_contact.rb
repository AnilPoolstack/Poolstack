class AddCountryCodeToContact < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :country_code, :integer
  end
end

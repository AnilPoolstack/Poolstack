ActiveAdmin.register Contact do
permit_params :full_name,:email,:message,:contact_number, :country_code


  form do |f|
    f.inputs do
      f.input :full_name
      f.input :email
      f.input :message
      f.input :country_code, :as=> :select , collection: JSON.parse(HTTParty.get("http://country.io/phone.json").body)
      f.input :contact_number
    end
    f.actions
  end

end

ActiveAdmin.register Contact do
permit_params :full_name,:email,:message,:contact_number
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :email, :message, :contact_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :email, :message, :contact_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

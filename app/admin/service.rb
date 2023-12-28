ActiveAdmin.register Service do
    # permit_params :email, :password, :password_confirmation
  
    index do
      selectable_column
      id_column
      column :service_name
      column :service_description
      column :category
      column :created_at
      column :updated_at
      actions
    end
  
    filter :service_name
    filter :service_description
    filter :category
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :service_name
        f.input :service_description
        f.input :category
      end
      f.actions
    end
  
  end
  
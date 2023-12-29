ActiveAdmin.register Service do
  permit_params :service_name, :service_description, :category, :service_image
  scope("All Categories", default: true) { |scope| scope.all }
  scope("Frontend"){ |scope| scope.where(category: "frontend_development")}
  scope("Backend"){ |scope| scope.where(category: "backend_development")}
  scope("DevOps"){ |scope| scope.where(category: "devops")}


  index do
    selectable_column
    id_column
    column :service_name
    column :service_description
    column :service_image do |service|
      if service.service_image.attached?
        image_tag service.service_image, size: "100x100"
       end
     end
    column :created_at
    column :updated_at
    actions
  end

  show do |service|
      attributes_table do
        row :service_name
        row :service_description
        row :category
        row :service_image do |service|
        if service.service_image.attached?
            image_tag service.service_image, size: "100x100"
          end
        end
        row :created_at
        row :updated_at
    end
  end
    

  filter :service_name
  filter :service_description
  filter :category    
  filter :created_at

  form do |f|
    f.inputs do
      f.input :service_name
      f.input :service_description, as: :quill_editor
      f.input :category
      f.input :service_image, as: :file
    end
    f.actions 
  end

end
  
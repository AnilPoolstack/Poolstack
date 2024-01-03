ActiveAdmin.register Service do
  permit_params :service_name, :service_description, :service_image, :category_id

  scope("All Categories", default: true) { |scope| scope.all }
  Category.pluck(:name).each do |name|
    scope(name.titleize) do |scope|
      scope.includes(:category).where(categories: { name: name })
    end
  end 

  index do
    selectable_column
    id_column
    column :service_name
    column :service_description do |service|
      raw service.service_description.gsub(/<img/, '<img style="max-width: 100px; max-height: 100px;"')
    end
    column :service_image do |service|
      if service.service_image.attached?
        image_tag service.service_image, size: "100x100"
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  show  title:"service" do |service|
    attributes_table do
      row :id do
        service.id
      end
      row :category
      row :service_name
      row :service_description do |service|
        raw service.service_description.gsub(/<img/, '<img style="max-width: 100px; max-height: 100px;"')
      end
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
  filter :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }    
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :service_name
      f.input :service_description, as: :quill_editor 
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :service_image, as: :file
    end
    f.actions 
  end

end
  
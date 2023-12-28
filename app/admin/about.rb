ActiveAdmin.register About do
  permit_params :description, :image

  index do
    selectable_column
    id_column
    column :description
    column :image do |about|
      if about.image.attached?
        image_tag about.image, size: "200x200"
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :description
      row :image do |about|
        if about.image.attached?
          image_tag about.image, size: "200x200"
        end
      end
      row :created_at
      row :updated_at
    end
  end

  filter :description
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :description
      f.input :image, as: :file, size: "200x200"
    end
    f.actions
  end
end

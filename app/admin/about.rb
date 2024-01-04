ActiveAdmin.register About do
  permit_params :description, :image

  index do
    selectable_column
    id_column
    column :description do |about|
      truncated_length = 500
      complete_description = strip_tags(about.description)
      truncated_description = truncate(complete_description, length: truncated_length)
      truncated_description += link_to('See more', admin_about_path(about)) if complete_description.length > truncated_length
      raw(truncated_description.gsub(/<img/, '<img style="max-width: 80px; max-height: 80px;"'))
   end
    column :image do |about|
      if about.image.attached?
        image_tag about.image, size: "200x200"
      end
    end
    column :created_at
    column :updated_at
    actions
  end
  

  show title: "About" do
    attributes_table do
      row :description do |about|
        raw about.description.gsub(/<img/, '<img style="max-width:100px; max-height:100px;"')
      end
      row :image do |about|
        if about.image.attached?
          image_tag about.image, size: "200x200"
        end
      end
      row :created_at
      row :updated_at
    end
  end

  # filter :description
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :description, as: :quill_editor
      f.input :image, as: :file, size: "200x200"
    end
    f.actions
  end
end

ActiveAdmin.register Blog do
    permit_params :company_name, :title, :description, :blog_image =>[], :logo_image =>[]

    index do
        selectable_column
        id_column
        column :logo_image do |blog|
          if blog.logo_image.attached?
            image_tag blog.logo_image
          end
        end
        column :company_name
        column :title
        column :description
        column :blog_image do |blog|
          if blog.blog_image.attached?
            image_tag blog.blog_image
          end
        end
        column :created_at
        column :updated_at
        actions
    end

  show do |user|
    attributes_table do
      row :logo_image do |blog|
        if blog.logo_image.attached?
          image_tag blog.logo_image
        end
      end
      row :company_name
      row :title
      row :description do |blog|
        raw blog.description
      end
      row :blog_image do |blog|
        if blog.blog_image.attached?
          image_tag blog.blog_image
        end
      end
      row :created_at
      row :updated_at
    end
  end

  filter :company_name
  filter :title
  filter :description
  filter :created_at
  filter :updated_at


  form do |f|
    f.inputs do
      f.inputs :logo_image, as: :file
      f.inputs :company_name
      f.inputs :title
      f.inputs :description
      f.inputs :blog_image, as: :file
    end
    f.actions
  end

end
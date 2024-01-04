ActiveAdmin.register Blog do
    permit_params :company_name, :title, :description, :blog_image, :logo_image
    
    index do
        selectable_column
        id_column
        column :logo_image do |blog|
          if blog.logo_image.attached?
            image_tag blog.logo_image, size: "80x80"
          end
        end
        column :company_name
        column :title
        column :description do |blog|
          truncated_length = 100
          complete_description = strip_tags(blog.description)
          truncated_description = truncate(complete_description, length: truncated_length)
          truncated_description += link_to('See more', admin_blog_path(blog)) if complete_description.length > truncated_length
          raw(blog.description.gsub(/<img/, '<img style="max-width: 100px; max-height: 100px;"'))
        end
        column :blog_image do |blog|
          if blog.blog_image.attached?
            image_tag blog.blog_image, size: "80x80"
          end
        end
        column :created_at
        column :updated_at
        actions
    end

    show title: "BLOG" do
      attributes_table do
        row :logo_image do |blog|
          if blog.logo_image.attached?
            image_tag blog.logo_image, size: "80x80"
          end
        end
        row :company_name
        row :title
        row :description do |blog|
          raw blog.description.gsub(/<img/, '<img style="max-width: 100px; max-height: 100px;"')
        end
        row :blog_image do |blog|
          if blog.blog_image.attached?
            image_tag blog.blog_image, size: "80x80"
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
      f.input :logo_image, as: :file
      f.input :company_name
      f.input :title
      f.input :description, as: :quill_editor
      f.input :blog_image, as: :file
    end
    f.actions
  end

end
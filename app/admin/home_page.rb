ActiveAdmin.register HomePage do
  permit_params :company_name, :logo_image, :background_image, :content

  index do
    selectable_column
    id_column
    column :logo_image do |home_page|
      if home_page.logo_image.attached?
        image_tag home_page.logo_image, size: "80x80"
      end
    end
    column :company_name
    column :background_image do |home_page|
      if home_page.background_image.attached?
        image_tag home_page.background_image, size: "80x80"
      end
    end
    column :content do |content|
      truncated_length = 500
      complete_content = strip_tags(content.content)
      truncated_content = truncate(complete_content, length: truncated_length)
      truncated_content += link_to('See more', admin_home_page_path(content)) if complete_content.length > truncated_length
      raw(truncated_content.gsub(/<img/, '<img style="max-width: 80px; max-height: 80px;"'))
    end
    column :created_at
    column :updated_at
    actions
  end

  show  title: "Home Page" do
    attributes_table do
      row :logo_image do |home_page|
        if home_page.logo_image.attached?
          image_tag home_page.logo_image, size: "80x80"
        end
      end
      row :company_name
      row :background_image do |home_page|
        if home_page.background_image.attached?
          image_tag home_page.background_image, size: "80x80"
        end
      end
      row :content do |home_page|
      raw home_page.content.gsub(/<img/, '<img style="max-width: 100px; max-height: 100px;"')
      end
      row :created_at
      row :updated_at
    end
  end

  filter :company_name
  filter :content
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs 'Home Page Details' do
      f.input :company_name
      f.input :logo_image, as: :file
      f.input :background_image, as: :file
      f.input :content, as: :quill_editor
    end
    f.actions
  end
end

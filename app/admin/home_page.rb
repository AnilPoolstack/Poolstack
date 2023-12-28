ActiveAdmin.register HomePage do
  permit_params :company_name, :logo_image, :background_image

  index do
    selectable_column
    id_column
    column :logo_image do |home_page|
      if home_page.logo_image.attached?
        image_tag home_page.logo_image, size: "200x200"
      end
    end
    column :company_name
    column :background_image do |home_page|
      if home_page.background_image.attached?
        image_tag home_page.background_image, size: "200x200"
      end
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :logo_image do |home_page|
        if home_page.logo_image.attached?
          image_tag home_page.logo_image, size: "200x200"
        end
      end
      row :company_name
      row :background_image do |home_page|
        if home_page.background_image.attached?
          image_tag home_page.background_image, size: "200x200"
        end
      end
      row :created_at
      row :updated_at
    end
  end

  filter :company_name
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs 'Home Page Details' do
      f.input :company_name
      f.input :logo_image, as: :file
      f.input :background_image, as: :file
    end
    f.actions
  end
end
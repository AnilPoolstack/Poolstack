ActiveAdmin.register Comment, as: 'BlogComment' do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :content, :blog_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :content, :blog_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  permit_params :email, :content, :blog_id

  belongs_to :blog, optional: true # This specifies the association

  # Define the index view to display comments for a specific blog
  controller  do
    def scoped_collection
      if params[:blog_id].present?
        Comment.where(blog_id: params[:blog_id])
      else
        Comment.all
      end
    end
  end


  show title:"blog_comment" do |comment|
    attributes_table do
      row :blog_id do |comment|
        raw comment.blog_id
      end
      row :email do |comment|
        raw comment.email
      end
      row :content do |comment|
        raw comment.content
      end
      row :created_at
      row :updated_at
    end
  end



  # form do |f|
  #   f.inputs do
      
  #     f.inputs :email
  #     f.inputs :content
  #     # f.inputs :blog_id
      
  #   end
  #   f.actions
  # end
  
end

ActiveAdmin.register Comment, as: 'BlogComment' do

  
  permit_params :email, :content, :blog_id

  belongs_to :blog, optional: true 

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
  
end

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :email, :content
end

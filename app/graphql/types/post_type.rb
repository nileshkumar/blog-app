module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :body, String, null: true
    field :user_id, Integer, null: false

    field :comments, [Types::CommentType], null: false
  end
end

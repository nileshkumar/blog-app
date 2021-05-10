module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :name, String, null: true

    field :posts, [Types::PostType], null: false
    field :post_count, Integer, null: false

    def post_count
      object.posts.count
    end

  end
end

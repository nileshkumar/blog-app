module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: true
    field :posts, [Types::PostType], null: true
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    field :post, Types::PostType, null: true do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def posts
      Post.all
    end

    def user(id:)
      User.find(id)
    end

    def post(id:)
      Post.find(id)
    end
  end
end

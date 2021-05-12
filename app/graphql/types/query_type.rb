module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: true
    field :posts, [Types::PostType], null: true do
      argument :user_id, Integer, required: true
    end
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    field :post, Types::PostType, null: true do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def posts(user_id:)
      user = User.find user_id
      user.posts
    end

    def user(id:)
      User.find(id)
    end

    def post(id:)
      Post.find(id)
    end
  end
end

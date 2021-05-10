module Types
  class MutationType < Types::BaseObject

    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser

    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
    field :delete_post, mutation: Mutations::DeletePost

    field :create_comment, mutation: Mutations::CreateComment
    field :update_comment, mutation: Mutations::UpdateComment
    field :delete_comment, mutation: Mutations::DeleteComment

    field :create_reaction, mutation: Mutations::CreateReaction
    field :delete_reaction, mutation: Mutations::DeleteReaction
  end
end

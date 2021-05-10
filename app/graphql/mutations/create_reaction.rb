class Mutations::CreateReaction < Mutations::BaseMutation
  description "creates a reaction for a post comment"

  argument :post_id, Integer, required: true
  argument :user_id, Integer, required: true
  argument :reaction, String, required: true

  field :comment, Types::CommentType, null: false
  field :errors, [String], null: false

  def resolve(post_id:, user_id:, reaction:)
    comment = Comment.where(post_id: post_id, user_id: user_id).first
    comment.reactions << Reaction.find_by(name: reaction)

    if comment.errors.blank?
      {
        comment: comment,
        errors: []
      }
    else
      {
        comment: nil,
        errors: comment.errors.full_messages
      }
    end
  end
end


=begin
mutation {
  createReaction(input: {
    postId: 5
    userId: 1
    reaction: "like"
  }){
    comment {
      id
      reactions {
        name
      }
    }
  }
}
=end

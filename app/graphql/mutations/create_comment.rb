class Mutations::CreateComment < Mutations::BaseMutation
  description "creates a comment for a post"

  argument :comment, String, required: true
  argument :user_id, Integer, required: true
  argument :post_id, Integer, required: true
  # argument :reaction, String, required: true

  field :comment, Types::CommentType, null: false
  field :errors, [String], null: false

  # def resolve(comment:, user_id:, post_id:, reaction: )
  def resolve(comment:, user_id:, post_id:)
    comment = Comment.new(
        post_id: post_id,
        comment: comment,
        user_id: user_id
    )

    if comment.save
      # reaction = Reaction.find_by(name: reaction)
      # comment.reactions << reaction
      {
        comment: comment, errors: []
      }
    else
      {
       comment: nil, errors: comment.errors.full_messages
      }
    end
  end

end

=begin
mutation {
  createComment(input: {
    comment: "this is new comment"
    userId: 1
    postId: 1
  })
  {
    comment {
      postId
      userId
    }
    errors
  }
}
=end

class Mutations::UpdateComment < Mutations::BaseMutation
  description "updates a comment for a post"

  argument :comment, String, required: true
  argument :post_id, Integer, required: true
  argument :user_id, Integer, required: true

  field :comment, Types::CommentType, null: false
  field :errors, [String], null: false

  def resolve(comment:, post_id:, user_id:)
    new_comment = comment
    comment = Comment.where(post_id: post_id, user_id: user_id).first
    comment.update(comment: new_comment)

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
  updateComment(input: {
     comment: "De Facto term!!"
     postId: 6
     userId: 8
  }){
    comment {
      comment
    }
    errors
  }
}
=end

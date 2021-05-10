class Mutations::DeleteComment < Mutations::BaseMutation

description "deletes a comment"

argument :post_id, Integer, required: true
argument :user_id, Integer, required: true

field :comment, Types::CommentType, null: false
field :errors, [String], null: false

def resolve(post_id:, user_id:)
  comment = Comment.where(post_id: post_id, user_id: user_id).first
  comment.destroy

  if comment.errors.blank?
    {
      comment: comment, errors:[]
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
 deleteComment(input: {
   postId: 1
   userId: 1

}){
  comment {
    comment
    id
  }
  errors
}
}
=end

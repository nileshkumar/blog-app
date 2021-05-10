class Mutations::DeletePost < Mutations::BaseMutation
 description "deletes a post"

 argument :id, ID, required: true

 field :post, Types::PostType, null: false
 field :errors, [String], null: false

 def resolve(id:)
   post = Post.find(id)
   post.destroy

   if post.errors.blank?
     {
       post: post,
       errors: []
     }
   else
     {
       post: [],
       errors: post.errors.full_messages
     }
   end
 end
end

=begin
mutation {
   deletePost(input: {
    id: 5
  }){
    post {
      id
      title
    }
    errors
  }
}
=end

class Mutations::UpdatePost < Mutations::BaseMutation
  description "updates a post"

  argument :title, String, required: true
  argument :id, ID, required: true

  field :post, Types::PostType, null: false
  field :errors, [String], null: false

  def resolve(id:, title:)
    post = Post.find(id)
    post.update(title: title)
    
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
  updatePost(input:{
    id: 3
    title: "First Ruby Article"

  }){
    post {
      title
      id
    }
    errors
  }
}


=end

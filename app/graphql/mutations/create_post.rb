class Mutations::CreatePost < Mutations::BaseMutation
 description "creates a post"

 argument :title, String, required: true
 argument :description, String, required: true
 argument :body, String, required: true
 argument :user_id, Integer, required: true

 field :post, Types::PostType, null: false
 field :errors, [String], null: false

 def resolve(title:, description:, body:, user_id:)
   user = User.find user_id
   post = user.posts.new(
     title: title,
     description: description,
     body: body)

     if post.save
       {
         post: post,
         errors: []
       }
     else
       {
         post: nil,
         errors: post.errors.full_messages
       }
     end

  end
end


=begin
mutation {
  createPost(
    input: {
      title: "First Ruby post"
      description: "it's a nice post about ruby"
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tristique purus turpis, quis tincidunt quam consectetur at. Vestibulum ultricies velit lacus."
      userId: 3

    }
  ){
    post {
      title
      description
      body
      userId
    }
    errors
  }

}
=end

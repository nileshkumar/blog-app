#Reaction table
Reaction.create(name: "smile")
Reaction.create(name: "like")
Reaction.create(name: "thumbs-up")


#users
#Post
#comment
#reactions
2.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

  3.times do
    post = user.posts.create(
      title: Faker::Books::Dune.title,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      body: Faker::Lorem.paragraphs)

  2.times do
    comment = post.comments.create(comment: Faker::Lorem.paragraphs(number: 1), user_id: rand(1..2))
    comment.reactions << Reaction.first
  end
 end
end

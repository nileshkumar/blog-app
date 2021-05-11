require "rails_helper"

RSpec.describe Types::QueryType do

  describe "posts" do
     let!(:posts) {create_pair(:post)}

     let(:query) do
       %(query {
         posts {
           title
           userId
         }
       })
     end

     subject(:result) do
       BlogAppSchema.execute(query).as_json
     end

     it "returns all the posts" do
       expect(result.dig("data", "posts")).to match_array(
        posts.map { |post| { "title" => post.title, "userId" =>  post.user_id} }
      )
     end
  end
end

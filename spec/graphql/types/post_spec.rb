require "rails_helper"

RSpec.describe Types::QueryType do

  describe "post" do
     let!(:post) {create(:post)}

     let(:query) do
       %(query {
         post(id: #{post.id}){
           id
           title
         }
       })
     end

     subject(:result) do
       BlogAppSchema.execute(query).as_json
     end

     it "returns one post" do
       expect(result["data"]["post"]["title"]).to eq(post.title)
     end
  end
end

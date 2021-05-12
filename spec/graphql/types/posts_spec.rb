require "rails_helper"

RSpec.describe Types::QueryType do

  describe "posts" do
     before(:each) do
       @user = create(:user)
     end

     let(:query) do
       %(query {
         posts(userId: #{@user.id}){
           title
           userId
         }
       })
     end

     subject(:result) do
       BlogAppSchema.execute(query).as_json
     end

     it "returns all the posts for a user" do
       post1 = create(:post, user_id: @user.id)
       post2 = create(:post, user_id: @user.id)
       expect(result["data"]['posts'].size).to eq(@user.posts.size)
     end
  end
end

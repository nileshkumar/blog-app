require "rails_helper"

RSpec.describe Types::QueryType do

  describe "users" do
     let!(:users) {create_pair(:user)}

     let(:query) do
       %(query {
         users {
           name
           email
         }
       })
     end

     subject(:result) do
       BlogAppSchema.execute(query).as_json
     end

     it "returns all the users" do
       expect(result.dig("data", "users")).to match_array(
        users.map { |user| { "name" => user.name, "email" => user.email } }
      )
     end
  end
end

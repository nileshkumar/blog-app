require "rails_helper"

RSpec.describe Mutations::CreateUser do
  describe "users" do
    let!(:user) {create(:user)}

    let(:mutation) do
        %(mutation{
          createUser(input:{
             name: "#{user.name}",
             email: "#{user.email}"
            }){
              user {
                name
                email
              }
              errors
            }
        })
      end

    subject(:result) do
      BlogAppSchema.execute(mutation).as_json
    end

    it "should create user" do
      expect(result["data"]["createUser"]["user"]["errors"]).to eq(nil)
      expect(result["data"]["createUser"]["user"]["name"]).to eq(user.name)
    end

  end
end

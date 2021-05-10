class Mutations::UpdateUser < Mutations::BaseMutation
  description "update a user"

  argument :name, String, required: true
  argument :id, ID, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(name:, id:)
    user = User.find(id)
    user.update(name: name)

    if user.errors.blank?
      {user: user, errors: []}
    else
     {user: [], errors: user.errors.full_messages}
    end
  end

end

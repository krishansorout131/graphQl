class Mutations::DeleteUser < Mutations::BaseMutation
  argument :id, ID, required: true

  field :message, String, null: false
  field :errors, [String], null: false

  def resolve(id:)
    user = User.find_by(id: id)
    if user && user.destroy
      { message: "user deleted", errors: [] }
    else
      { message: "user not found", errors: user&.errors&.full_messages || [] }
    end
  end

end
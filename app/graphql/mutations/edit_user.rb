class Mutations::EditUser < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true

  field :message, String, null: false
  field :status, Integer, null: false

  def resolve(id:, first_name:, last_name:, email:)
    user = User.find_by(id: id)

    if user 
      user.update(first_name: first_name, last_name: last_name, email: email)
      message = "User Update successfully!"
      status = 200
    else
      message = "User not found!"
      status = 404
    end
    { message: message, status: status}
  end

end
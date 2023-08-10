module Types
  class UserInputType < Types::BaseInputObject
    argument :email, String, required: true
    argument :firstName, String, required: true
    argument :lastName, String, required: true
  end
end
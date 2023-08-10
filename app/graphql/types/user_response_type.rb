# frozen_string_literal: true

module Types
  class UserResponseType < Types::BaseObject
    # for sending multiple things in a query type
    field :message, String, null: false
    field :users, [Types::UserType], null: false
    field :error, String, null: true
  end
end

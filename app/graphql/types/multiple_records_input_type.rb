module Types
  class MultipleRecordsInputType < Types::BaseInputObject#Types::BaseObject
    argument :user, Types::UserInputType, required: true
    argument :movie, Types::MovieInputType, required: true
    
  end

end
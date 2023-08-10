class User < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end

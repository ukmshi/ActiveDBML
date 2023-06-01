class User < ApplicationRecord
  has_many :article,      foreign_key: 'user_id'
  has_many :comment,      foreign_key: 'user_id'
  has_one :user_profile,  foreign_key: 'user_id'
end

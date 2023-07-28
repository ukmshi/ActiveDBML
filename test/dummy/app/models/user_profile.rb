class UserProfile < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  enum sex_code: {
    man:   '01',
    woman: '02',
  }, _prefix: true
end

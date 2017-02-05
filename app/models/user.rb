class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :length => {:within => 8..30},
                       :uniqueness => true
  validates :email, :presence => true,
                    :format => EMAIL_REGEX,
                    :confirmation => true
end

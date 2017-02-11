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
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create

  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update

end

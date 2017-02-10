class Church < ApplicationRecord
  validates :name, :presence => true
  validates :description, :presence => true
  validates :address, :presence => true
  validates :website, :presence => true
end

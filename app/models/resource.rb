class Resource < ApplicationRecord
  validates :title, :presence => true
  validates :hyperlink, :presence => true
end

class Menu < ApplicationRecord
  validates :menu, :presence => true
  validates :event_date, :presence => true
end

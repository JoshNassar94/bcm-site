class Event < ApplicationRecord
  validates :title, :presence => true
  validates :description, :presence => true
  validates :location, :presence => true
  validates :event_date, :presence => true
  validates :imageName, :presence => true

  def uploaded_file=(file_field)
    self.imageName = base_part_of(file_field.original_filename)
    self.imageData = file_field.read
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end
end

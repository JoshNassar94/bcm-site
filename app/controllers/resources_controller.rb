class ResourcesController < ApplicationController
  def newsletter
  end

  def sermon_notes
  end

  def testimonies
  end

  def resources
    @resource = Resource.new
    @resources = Resource.order(:title)
  end
end

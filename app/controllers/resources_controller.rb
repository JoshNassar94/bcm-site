class ResourcesController < ApplicationController
  def newsletter
  end

  def sermon_notes
  end

  def testimonies
  end

  def helpful_links
    @resource = Resource.new
    @resources = Resource.order(:title)
  end
    
  def bistro_menu
    @menu = Menu.new
    @menus = Menu.order(:event_date).reverse_order
  end
end

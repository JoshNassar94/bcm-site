class GetInvolvedController < ApplicationController
  def upcoming_events
    @events = Event.order(:event_date)
  end

  def weekly_gatherings
  end

  def small_groups
    @small_groups = SmallGroup.order(:group_type)
  end

  def local_churches
    @churches = Church.order(:id)
  end

  def show_image
    @small_group = SmallGroup.find(params[:id])
    send_data(@small_group.imageData, filename: @small_group.imageName, disposition: "inline")
  end
end

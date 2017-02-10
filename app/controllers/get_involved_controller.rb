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

  def show_staff_image
    @staff = StaffMember.find(params[:id])
    send_data(@staff.imageData, filename: @staff.imageName, disposition: "inline")
  end

  def show_small_group_image
    @small_group = SmallGroup.find(params[:id])
    send_data(@small_group.imageData, filename: @small_group.imageName, disposition: "inline")
  end

  def show_event_image
    @event = Event.find(params[:id])
    send_data(@event.imageData, filename: @event.imageName, disposition: "inline")
  end
end

class GetInvolvedController < ApplicationController
  def upcoming_events
    @events = Event.where(['event_date > ?', DateTime.now]).order(:event_date)
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

  def add_bistro_menu
    authenticate_user
    @menu = Menu.new(menu_params)

    if @menu.save
      flash[:success] = "Added a new menu"
      redirect_to("/resources/bistro_menu")
    else
      render("/resources/bistro_menu")
    end
  end

  def destroy_menu
    authenticate_user
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:danger] = "Deleted menu"
    redirect_to("/resources/bistro_menu")
  end

  private

  def menu_params
    params.require(:menu).permit(:menu, :event_date)
  end

  def authenticate_user
    if !session[:user_id].present?
      redirect_to('/admin/login')
    end
  end

end

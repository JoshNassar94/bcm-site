class GetInvolvedController < ApplicationController

  def weekly_gatherings
  end

  def show_staff_image
    @staff = StaffMember.find(params[:id])
    send_data(@staff.imageData, filename: @staff.imageName, disposition: "inline")
  end

  def add_resource
    authenticate_user
    @resource = Resource.new(resource_params)

    if @resource.save
      flash[:success] = "Added a new resource"
      redirect_to("/resources/helpful_links")
    else
      render("/resources/helpful_links")
    end
  end

  def destroy_resource
    authenticate_user
    @resource = Resource.find(params[:id])
    @resource.destroy
    flash[:danger] = "Deleted resource"
    redirect_to("/resources/helpful_links")
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

  def authenticate_user
    if !session[:user_id].present?
      redirect_to('/admin/login')
    end
  end
    
  def menu_params
    params.require(:menu).permit(:menu, :event_date)
  end

  def resource_params
    params.require(:resource).permit(:title, :hyperlink)
  end

end

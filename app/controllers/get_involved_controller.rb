class GetInvolvedController < ApplicationController

  def weekly_gatherings
  end

  def show_staff_image
    @staff = StaffMember.find(params[:id])
    send_data(@staff.imageData, filename: @staff.imageName, disposition: "inline")
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

end

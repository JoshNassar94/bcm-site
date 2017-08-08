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
      redirect_to("/resources/resources")
    else
      render("/resources/resources")
    end
  end

  def destroy_resource
    authenticate_user
    @resource = Resource.find(params[:id])
    @resource.destroy
    flash[:danger] = "Deleted resource"
    redirect_to("/resources/resources")
  end

  private

  def authenticate_user
    if !session[:user_id].present?
      redirect_to('/admin/login')
    end
  end

  def resource_params
    params.require(:resource).permit(:title, :hyperlink)
  end

end

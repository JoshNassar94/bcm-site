class AdminController < ApplicationController
protect_from_forgery with: :null_session

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to('/admin/manage')
    else
      flash.now[:danger] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:danger] = "Logged out"
    redirect_to("/admin/login")
  end

  def manage
    authenticate_user
  end

  def small_groups
    authenticate_user
    @small_group = SmallGroup.new
  end

  def add_small_group
    authenticate_user
    @small_group = SmallGroup.new(small_group_params)

    if @small_group.save
      redirect_to("/admin/manage")
    else
      render("small_groups")
    end
  end

  def edit_small_group
    @small_group = SmallGroup.find(params[:id])
  end

  def update_small_group
    @small_group = SmallGroup.find(params[:id])

    if @small_group.update_attributes(small_group_params)
      redirect_to("/get_involved/small_groups")
    else
      render("edit_small_group")
    end
  end

  def destroy_small_group
    @small_group = SmallGroup.find(params[:id])
    @small_group.destroy
    redirect_to("/get_involved/small_groups")
  end

  private

  def small_group_params
    params.require(:small_group).permit(:leader1, :leader2, :group_type, :description, :location, :day, :time, :image, :uploaded_file)
  end

  def authenticate_user
    if session[:user_id].present?
      render('manage')
    else
      redirect_to('/admin/login')
    end
  end
end

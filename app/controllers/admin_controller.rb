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
      session[:name] = authorized_user.first_name
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

  def admin_users
    @users = User.order(:id)
  end



  def staff
    authenticate_user
    @staff = StaffMember.new
  end

  def add_staff
    authenticate_user
    @staff = StaffMember.new(staff_params)

    if @staff.save
      flash[:success] = "Created a new staff member"
      redirect_to("/about_us/our_team")
    else
      render("staff")
    end
  end

  def edit_staff
    authenticate_user
    @staff = StaffMember.find(params[:id])
  end

  def update_staff
    authenticate_user
    @staff = StaffMember.find(params[:id])

    if @staff.update_attributes(staff_params)
      redirect_to("/about_us/our_team")
    else
      render("edit_staff")
    end
  end

  def destroy_staff
    authenticate_user
    @staff = StaffMember.find(params[:id])
    @staff.destroy
    redirect_to("/about_us/our_team")
  end





  def user
    authenticate_user
    @user = User.new
  end

  def add_user
    authenticate_user
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Created a new admin user"
      redirect_to("/admin/admin_users")
    else
      render("user")
    end
  end

  def edit_user
    authenticate_user
    @user = User.find(params[:id])
  end

  def update_user
    authenticate_user
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to("/admin/admin_users")
    else
      render("edit_user")
    end
  end

  def destroy_user
    authenticate_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to("/admin/admin_users")
  end




  private

  def staff_params
    params.require(:staff_member).permit(:name, :bio, :image, :uploaded_file)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def authenticate_user
    if !session[:user_id].present?
      redirect_to('/admin/login')
    end
  end
end

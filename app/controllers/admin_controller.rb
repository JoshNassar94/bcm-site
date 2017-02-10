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

  def admin_users
    @users = User.order(:id)
  end

  def small_groups
    authenticate_user
    @small_group = SmallGroup.new
  end

  def add_small_group
    authenticate_user
    @small_group = SmallGroup.new(small_group_params)

    if @small_group.save
      redirect_to("/get_involved/small_groups")
    else
      render("small_groups")
    end
  end

  def edit_small_group
    authenticate_user
    @small_group = SmallGroup.find(params[:id])
  end

  def update_small_group
    authenticate_user
    @small_group = SmallGroup.find(params[:id])

    if @small_group.update_attributes(small_group_params)
      redirect_to("/get_involved/small_groups")
    else
      render("edit_small_group")
    end
  end

  def destroy_small_group
    authenticate_user
    @small_group = SmallGroup.find(params[:id])
    @small_group.destroy
    redirect_to("/get_involved/small_groups")
  end






  def events
    authenticate_user
    @event = Event.new
  end

  def add_event
    authenticate_user
    @event = Event.new(event_params)

    if @event.save
      redirect_to("/get_involved/upcoming_events")
    else
      render("events")
    end
  end

  def edit_event
    authenticate_user
    @event = Event.find(params[:id])
  end

  def update_event
    authenticate_user
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to("/get_involved/upcoming_events")
    else
      render("edit_event")
    end
  end

  def destroy_event
    authenticate_user
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to("/get_involved/upcoming_events")
  end





  def staff
    authenticate_user
    @staff = StaffMember.new
  end

  def add_staff
    authenticate_user
    @staff = StaffMember.new(staff_params)

    if @staff.save
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






  def churches
    authenticate_user
    @church = Church.new
  end

  def add_church
    authenticate_user
    @church = Church.new(church_params)

    if @church.save
      redirect_to("/get_involved/local_churches")
    else
      render("churches")
    end
  end

  def edit_church
    authenticate_user
    @church = Church.find(params[:id])
  end

  def update_church
    authenticate_user
    @church = Church.find(params[:id])

    if @church.update_attributes(church_params)
      redirect_to("/get_involved/local_churches")
    else
      render("edit_church")
    end
  end

  def destroy_church
    authenticate_user
    @church = Church.find(params[:id])
    @church.destroy
    redirect_to("/get_involved/local_churches")
  end





  def user
    @user = User.new
  end

  def add_user
    authenticate_user
    @user = User.new(user_params)

    if @user.save
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

  def small_group_params
    params.require(:small_group).permit(:leader1, :leader2, :group_type, :description, :location, :day, :time, :image, :uploaded_file)
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date, :image, :uploaded_file)
  end

  def staff_params
    params.require(:staff_member).permit(:name, :bio, :image, :uploaded_file)
  end

  def church_params
    params.require(:church).permit(:name, :description, :address, :website)
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

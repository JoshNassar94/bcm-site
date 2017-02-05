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

  end
end

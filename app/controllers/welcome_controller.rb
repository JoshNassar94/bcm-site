class WelcomeController < ApplicationController
  def index
    @logged_in = session[:user_id]
  end

  def test
    @id = params['id']
  end
end

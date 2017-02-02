class WelcomeController < ApplicationController
  def index

  end

  def test
    @id = params['id']
  end
end

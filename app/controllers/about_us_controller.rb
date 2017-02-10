class AboutUsController < ApplicationController
  def our_team
    @staff = StaffMember.order(:created_at)
  end

  def our_mission
  end
end

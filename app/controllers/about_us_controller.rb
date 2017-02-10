class AboutUsController < ApplicationController
  def our_team
    @staff = StaffMember.order(:created_at)
  end

  def our_mission
  end

  def faqs
  end

  def social_media
  end
end

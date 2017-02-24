class AboutUsController < ApplicationController
  def our_team
    @staff = StaffMember.order(:created_at)
  end

  def our_mission
  end

  def contact
    @message = Message.new
  end

  def sendEmail
    @message = Message.new(message_params)

    if @message.valid?
      ContactMailer.contact_email(@message).deliver
      @messageSent = true
      flash[:success] = "Thanks for sending us a message! We'll get back to you soon!"
      redirect_to root_path
    else
      @messageSent = false
      flash.now[:danger] = "Please make sure to fill out all fields!"
      render('contact')
    end
  end


  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end

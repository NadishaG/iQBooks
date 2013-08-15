class MessageMailer < ActionMailer::Base

  def send_issue_notification(_issue_record)
    @message = _message
    @email = _email
    mail(:to => _email, :subject => "#{@message.sender.try(:fullname)} has sent you a secure message in "+t('common.app_name'), :from => "#{@message.sender.try(:username)}@#{t('common.small_app_name')}.com")  
  end

  def send_ondemand_book_notification(_book)
  	
  end
end

class UserMailer < ApplicationMailer
  def report(name, email, pdf)
  	@name=name
    mail(to: email, subject: 'Job', from: 'info@admin.com') do |format|
    	# format.text
    	format.html
    	format.pdf { attachments['job'] = pdf }
    end
  end
end

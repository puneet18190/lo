class UserMailer < ApplicationMailer
  def report(user_id)
  	@user=User.find(user_id)
  	@name=@user.name
  	current_user=@user
  	a = @user.answers.last
    @data1 = JSON.parse a.data.gsub('=>', ':')
    @data=Question.all
    @total_score=0
    @total_goal=0
    @data1.each{|a| @total_score = @total_score+a["score"].to_i}
    @data1.each{|a| @total_goal = @total_goal+a["goal"].to_i}
    mail(to: @user.email, subject: 'Job', from: 'info@admin.com') do |format|
    	format.text
    	format.html
    	format.pdf do
	      attachments['result.pdf'] = WickedPdf.new.pdf_from_string(
	        render_to_string(:pdf => "result",:template => 'home/answers.pdf.erb')
	      )
	    end
    end
  end
end

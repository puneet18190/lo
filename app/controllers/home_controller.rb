class HomeController < ApplicationController
  # skip_before_action :verify_authenticity_token, :only => [:add_answer]
  before_action :authenticate_user!, only: [:questions, :completed]
  def index
  	@data=Question.all
  end

  def start
    if user_signed_in?
      session["info"]=[]# if session.has_key?(:data)
      redirect_to "/questions/1"
    else
      redirect_to "/users/sign_in"
    end
  end

  def questions
  	@q = Question.find(params[:id])
  	if @q.present?
      # session["info"] = {}
      # redirect_to "/questions/#{params[:id].to_i+1}"
  	else
  		redirect_to root_url, alert: 'Invalid Question'
  	end
  end

  def add_answer
  	# binding.pry
    session["info"].push({"id"=>params["id"], "score"=>params["score"], "goal"=>params["goal"], "feedback"=>params["feedback"]})
    # session["info"] = [] if params[:id] == 1
    # session["info"]["q#{params['id']}"] = []
    # session["info"]["q#{params['id']}"].push({ "score"=>params["score"], "goal"=>params["goal"], "feedback"=>params["feedback"]})
    if params[:id].to_i.between?(1,7)
      redirect_to "/questions/#{params[:id].to_i+1}"
    elsif params[:id].to_i == 8
      Answer.create(user_id: current_user.id, data: session["info"])
      call_crm
      session["info"]=[]
      redirect_to "/thank-you"
    else
      redirect_to root_url, alert: 'Invalid Question'
    end  
  end

  def call_crm
    begin
      q1=session["info"].select{|b| b["id"]=="1"}.first
      q2=session["info"].select{|b| b["id"]=="2"}.first
      q3=session["info"].select{|b| b["id"]=="3"}.first
      q4=session["info"].select{|b| b["id"]=="4"}.first
      q5=session["info"].select{|b| b["id"]=="5"}.first
      q6=session["info"].select{|b| b["id"]=="6"}.first
      q7=session["info"].select{|b| b["id"]=="7"}.first
      q8=session["info"].select{|b| b["id"]=="8"}.first

      res = HTTParty.post("https://www.tapapp.com/2734856/LeadImport/Scorecard.aspx", :query => { 
        name: current_user.name,  
        email: current_user.email,
        question_1: { score: q1['score'], goal: q1['goal'], feedback: q1['feedback'] },
        question_2: { score: q2['score'], goal: q2['goal'], feedback: q2['feedback'] },
        question_3: { score: q3['score'], goal: q3['goal'], feedback: q3['feedback'] },
        question_4: { score: q4['score'], goal: q4['goal'], feedback: q4['feedback'] },
        question_5: { score: q5['score'], goal: q5['goal'], feedback: q5['feedback'] },
        question_6: { score: q6['score'], goal: q6['goal'], feedback: q6['feedback'] },
        question_7: { score: q7['score'], goal: q7['goal'], feedback: q7['feedback'] },
        question_8: { score: q8['score'], goal: q8['goal'], feedback: q8['feedback'] }
      })
      puts "API runs sucessfully."
      puts res
    rescue Exception => e
      puts "Exception in API: #{e.message}"
    end
  end

  def send_report
    a = current_user.answers.last
    @data1 = JSON.parse a.data.gsub('=>', ':')
    @data=Question.all
    @total_score=0
    @total_goal=0
    @data1.each{|a| @total_score = @total_score+a["score"].to_i}
    @data1.each{|a| @total_goal = @total_goal+a["goal"].to_i}
    report = WickedPdf.new.pdf_from_string(render_to_string(:template => 'home/answers.pdf.erb'))
    UserMailer.report(current_user.name, current_user.email, report).deliver_now
  end

  def completed
    a = current_user.answers.last
    @data1 = JSON.parse a.data.gsub('=>', ':')
    @data=Question.all
    @total_score=0
    @total_goal=0
    @data1.each{|a| @total_score = @total_score+a["score"].to_i}
    @data1.each{|a| @total_goal = @total_goal+a["goal"].to_i}
  end

  def previous_tests
    @data = current_user.answers.all
  end

  def answers
    a = current_user.answers.find(params[:id])
    @data1 = JSON.parse a.data.gsub('=>', ':')
    @data=Question.all
    @total_score=0
    @total_goal=0
    @data1.each{|a| @total_score = @total_score+a["score"].to_i}
    @data1.each{|a| @total_goal = @total_goal+a["goal"].to_i}
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", layout: "application"
      end
    end
  end
end

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
      session["info"]=[]
      redirect_to "/thank-you"
    else
      redirect_to root_url, alert: 'Invalid Question'
    end  
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
end

class UserScoreController < ApplicationController

  def index
  end


  def new
  end

  def create
    score = UserScore.create(data from user)
    score.health_score = score.algorithm
    score.save
  end

  def graph  #make associated view
   @user_score_params = UserScore.last

   if params(:date) == "Daily"
    elsif params(:date) == "Weekly"
     @user_score_params = UserScore.last(7)
    elsif params(:date) == "Monthly"
     @user_score_params = UserScore.last(25)  #make this logic work w/ helper function for MONTHS
    end

   @health_score = []
   @bmi = []
   @dates = []

   @user_score_params.each do |score|
     health_score << score.health_score.round
     bmi << score.bmi
     dates << score.logdate
   end
  end


end

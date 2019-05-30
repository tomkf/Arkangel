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

  def graph
    @user_score_params = UserScore.order(:logdate).last(7)

    if params[:date] == "Weekly"
      @user_score_params = UserScore.order(:logdate).last(7)
    elsif params[:date] == "Monthly"
      @user_score_params = UserScore.order(:logdate).last(30) # make this logic work w/ helper function for MONTHS
    elsif params[:date] == "All history"
      @user_score_params = UserScore.order(:logdate)
    end

    @health_score = []
    @bmi = []
    @dates = []
    @ids = []

    @user_score_params.each do |score|
      @health_score << score.health_score.round
      @bmi << score.bmi
      @dates << "#{Date::ABBR_MONTHNAMES[score.logdate.month]} #{score.logdate.day.to_s}"#.slice(5..9)
      @ids << score.id
    end
  end

  def day_graph
    @user_score = UserScore.find(params[:score])
  end

def update_score
  @user = current_user
end


def weight_score
end

def exercise_score
end

def food_score
  end

end

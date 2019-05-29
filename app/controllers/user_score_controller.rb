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

  def graph_display


    weekly_scores = UserScore.last(7)
    graph_array =

  end
end

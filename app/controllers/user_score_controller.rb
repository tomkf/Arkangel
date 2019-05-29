class UserScoreController < ApplicationController


  def index

    @userscoresweek = UserScore.last(28)

  end


  def new
  end

  def create

    score = Score.create(data from user)

    score.health_score = score.algorithm

    score.save


  end



end

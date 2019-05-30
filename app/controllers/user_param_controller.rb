class UserParamController < ApplicationController
def update_score
  @user = current_user
end

def weight_score
  @user = current_user
  @weight = @users.user_params.weight
end

def exercise_score
end

def food_score
  end
end







class UserParamController < ApplicationController
def create
end

def new
  @user_param = UserParam.new(user: current_user)
end
end




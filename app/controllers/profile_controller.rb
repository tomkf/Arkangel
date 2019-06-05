class ProfileController < ApplicationController
    def index
    @user = current_user
    @health_score = FitbitScore.where("user_id = #{current_user.id}").last
    end
end

class ProfileController < ApplicationController
    def index
    @user = current_user
    if @user.fitbit_user_id.nil?
        redirect_to apis_path
    end
    @health_score = FitbitScore.where("user_id = #{current_user.id}").last
    end
end

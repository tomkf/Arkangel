class ProfileController < ApplicationController
    def index

     @user = current_user
    if @user.fitbit_scores.order(:logdate).last.nil?
       redirect_to apis_path
    end
    @user = current_user
    @health_score = FitbitScore.where("user_id = #{current_user.id}").order(:logdate).last
    @parmas_data = UserParam.where("user_id = #{current_user.id}").last
    end
end

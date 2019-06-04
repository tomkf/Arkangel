class ProfileController < ApplicationController
    def index
    @user = current_user
    # @health_score = @user.user_scores.last.health_score
    end
end

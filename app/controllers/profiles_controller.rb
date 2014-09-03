class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_id(params[:id])
  	@questions = @user.questions.all
  	@answers = @user.answers.all
  	if @user
  		render :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end

class AnswersController < ApplicationController
	before_action :authenticate_user!, only: [:create]

	def create
		@answer = Answer.new(answer_params)
		@answer.question_id = params[:question_id]
		if @answer.save
			flash[:success] = "Successfully posted an answer."
			redirect_to question_path(@answer.question)
		else
			flash[:error] = "Something went wrong. Please try again."
			render :new
		end
	end

	private

	def answer_params
		params.require(:answer).permit(:body, :user_id)
	end
end
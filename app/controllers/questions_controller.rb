class QuestionsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :update]

	def index
		@questions = Question.all
	end

	def show
		@question = Question.find(params[:id])
		@answer = Answer.new
		@answer.question_id = @question.id

	end

	def new
		@question = Question.new
	end


	def create
		@question = Question.new(question_params)
		if @question.save
			flash[:success] = "Your question is posted."
			redirect_to questions_path
		else
			flash[:error] = "An error occured. Try again."
			render :new
		end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		
		if params[:question][:vote]
			@question.score += params[:question][:vote].to_i
		end
		
		if @question.update(question_params)
			flash[:success] = "Updated!"
			redirect_to questions_path
		else
			flash[:error] = "Something went wrong. Try again."
			redirect_to questions_path
		end
	end

	def destroy
		@question = Question.find(params[:id])
		if @question.destroy
			flash[:success] = "Successfully deleted the question"
			redirect_to questions_path
		else
			flash[:error] = "Something went wrong. Try again."
			redirect_to questions_path
		end
	end

	private

	def question_params
		params.require(:question).permit(:title, :content, :user_id)
	end
end
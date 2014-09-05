class PositionsController < ApplicationController
	before_action :authenticate_user!

	def create
		@position = Position.new(position_params)
		if @position.save
			flash[:success] = "Position successfully added."
			redirect_to '/profiles/' + params[:position][:user_id]
		else
			flash[:error] = "Something went wrong. Try again."
			redirect_to '/profiles/' + params[:position][:user_id]
		end
	end

	def destroy
		position = Position.find(params[:id])
		if position.destroy
			flash[:success] = "Position successfully deleted."
			redirect_to '/profiles/' + position.user.id.to_s
		else
			flash[:error] = "Something went wrong. Try again."
			redirect_to '/profiles/' + position.user.id.to_s
		end
	end

	private

	def position_params
		params.require(:position).permit(:title, :company, :requirements, :start_date, :end_date, :user_id)
	end
end
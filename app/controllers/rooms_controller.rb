class RoomsController < ApplicationController
	def index
		@rooms = Room.all
	end
	def new
		@room = Room.new
	end
	def create
		@room = Room.new(permitted_parameters)

		if @room.save
			flash[:success] = "Room #{@room.name} was created succesfully"
			redirect_to rooms_path
		else
			render :new
		end
	end
	def show
	end
	def edit
	end


	private

	def permitted_parameters
		params.require(:room).permit(:name)
	end
end

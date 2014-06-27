class MoviesController < ApplicationController
	
	def index
	@movies = Movie.all
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params) # params[:movie] Old way of doing it before strong params,  unprotected
		if @movie.save
			redirect_to movies_path
		else 
			render :new
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to movies_path
	end

	def show 
		begin
			@movie = Movie.find(params[:id])
			render :show
		rescue ActiveRecord::RecordNotFound
			redirect_to movies_path
		end
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		if @movie.update(movie_params)
			redirect_to @movie
		else
			render :edit
		end
	end

	private
	def movie_params #Strong params
		params.require(:movie).permit(:title, :director)
	end 

end

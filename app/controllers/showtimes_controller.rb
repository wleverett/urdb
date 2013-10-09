class ShowtimesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @showtime = @movie.showtimes.new(showtime_params)

    if @showtime.save
      redirect_to @showtime.movie, notice: 'Showtime was created!'
    else
      redirect_to @showtime.movie, alert: 'Showtime not created!'
    end
  end 

  private

  def showtime_params
    params[:showtime].permit(:location, :time)
  end
end

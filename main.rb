require "sinatra"
require "sinatra/reloader"
require "movies"
require "image_suckr"
require "stock_quote"
require "pry"

get "/" do
  erb :index
end

get "/movie_details" do 
   @movie = Movies.find_by_title(params[:movie])
   suckr = ImageSuckr::GoogleSuckr.new
   @image = suckr.get_image_url({"q" => @movie.title})
   erb :movie
 end

 
 get "/picture_details" do
   @image = params[:picture]	
   suckr = ImageSuckr::GoogleSuckr.new
   @image = suckr.get_image_url({"q" => @image})
   erb :picture
end


 get "/stock_details" do 
   
   @stock = StockQuote::Stock.quote(params[:symbol])
   erb :stockquote
 end


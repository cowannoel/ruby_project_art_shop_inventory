require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/print.rb' )
also_reload( '../models/*' )

# index - show all
get '/prints' do
  @prints = Print.all
  erb(:"prints/index")
end

# new - get form to create new artist
get '/prints/new' do
  erb(:"prints/new")
end

# show show one
get '/prints/:id' do
  @print = Print.find(params[:id])
  erb(:"prints/show")
end
#
# # CREATE - fire request to create new artist in database
# post '/artists' do
#   artist = Artist.new(params)
#   artist.save()
#   redirect to '/artists'
# end
#
# # edit - get the page with the form prepopulated
# get '/artists/:id/edit' do # edit
#   @artist = Artist.find( params[:id] )
#   erb(:"artists/edit")
# end
#
# # update - fire a post request to update edited artist (see CREATE)
# post '/artists/:id' do
#   artist = Artist.new(params)
#   artist.update
#   redirect to "/artists/#{params['id']}"
# end
#
# # delele - fire a post request to delete from db
# post '/artists/:id/delete' do # delete
#   artist = Artist.find( params[:id] )
#   artist.delete()
#   redirect to '/artists'
# end

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

# CREATE - fire request to create new artist in database
post '/prints' do
  print = Print.new(params)
  print.save()
  redirect to '/prints'
end

# edit - get the page with the form prepopulated
get '/prints/:id/edit' do # edit
  @print = Print.find( params[:id] )
  erb(:"prints/edit")
end

# update - fire a post request to update edited artist (see CREATE)
post '/prints/:id' do
  print = Print.new(params)
  print.update
  redirect to "/prints/#{params['id']}"
end

# delele - fire a post request to delete from db
post '/prints/:id/delete' do # delete
  print = Print.find( params[:id] )
  print.delete()
  redirect to '/prints'
end

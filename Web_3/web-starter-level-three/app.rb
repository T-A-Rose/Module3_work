# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require "database_connection"
require "animals_table"
require "animal_entity"

require "advert_table"
require "advert_entry"


class WebApplicationServer < Sinatra::Base
  # This line allows us to send HTTP Verbs like `DELETE` using forms
  use Rack::MethodOverride

  configure :development do
    # In development mode (which you will be running) this enables the tool
    # to reload the server when your code changes
    register Sinatra::Reloader

    # In development mode, connect to the development database
    db = DatabaseConnection.new("localhost", "web_application_dev")
    $global = { db: db }
  end

  configure :test do
    # In test mode, connect to the test database
    db = DatabaseConnection.new("localhost", "web_application_test")
    $global = { db: db }
  end

  def animals_table
    $global[:animals_table] ||= AnimalsTable.new($global[:db])
  end

  def advert_table
    $global[:advert_table] ||=  AdvertTable.new($global[:db])
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE

  get '/advert' do
    erb :advert_index, locals: { advert: advert_table.list }
  end

  get "/advert/new" do
    erb :advert_new
  end

  post '/advert' do
    advert = AdvertEntry.new(params[:species], params[:animal_name], params[:colour])
    advert_table.add(advert)
    redirect '/advert'
  end

  delete '/advert/:index' do
    advert_table.remove(params[:index].to_i)
    redirect '/advert'
  end
  
  get '/advert/:index/edit' do
    advert_index = params[:index].to_i
    erb :advert_edit, locals: {
      index: advert_index,
      advert: advert_table.get(advert_index)
    }
  end

  patch '/advert/:index' do
    advert_index = params[:index].to_i
    advert_table.update(advert_index, params[:species])
    redirect '/advert'
  end

 

  # EXAMPLE ROUTES

  get '/animals' do
    erb :animals_index, locals: { animals: animals_table.list }
  end

  get '/animals/new' do
    erb :animals_new
  end

  post '/animals' do
    animal = AnimalEntity.new(params[:species])
    animals_table.add(animal)
    redirect '/animals'
  end

  delete '/animals/:index' do
    animals_table.remove(params[:index].to_i)
    redirect '/animals'
  end

  get '/animals/:index/edit' do
    animal_index = params[:index].to_i
    erb :animals_edit, locals: {
      index: animal_index,
      animal: animals_table.get(animal_index)
    }
  end

  patch '/animals/:index' do
    animal_index = params[:index].to_i
    animals_table.update(animal_index, params[:species])
    redirect '/animals'
  end
end

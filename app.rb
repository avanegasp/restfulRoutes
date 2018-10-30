require 'sinatra'
require 'data_mapper'

#database setup
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/dog.db")
class Dog
  include DataMapper::Resource
  property :id, Serial
  property :name, Text
end
DataMapper.finalize.auto_upgrade!

#index
get '/dogs' do
  @dogs = Dog.all
  erb :'dogs/index'
end

#new
get '/dogs/new' do
  erb :'dogs/new'
end

#create
post '/dogs' do
  # dogs.push(params["name"])
  Dog.create({:name => params[:nombre]})
  redirect '/dogs'
end

# show (definir variable de ruta)
get '/dogs/:id' do
  # id = params["id"].to_i
  # @dog = dogs[id]
  @dog = Dog.get(params["id"])
  erb :'dogs/show'
end

#edit
get '/dogs/:id/edit' do
  @dog = Dog.get(params["id"])
  erb :'dogs/edit'
end

#update
patch '/dogs/:id' do
  dog = Dog.get(params["id"])
  dog.update({:name => params[:nombre]})
  redirect '/dogs'
end

#destroy
delete '/dogs/:id' do
  dog = Dog.get(params["id"])
  dog.destroy
  redirect '/dogs'
end















































#EJERCICIO
#el proyecto se llama restfulcat
#tiene un index('/cats') (get) vamos a ver todos los gatos creados
#el cat va a tener una name e image(url) (el usuario debe colocar la url)

#'/cats/new' get
#'/cats' post

#implementar el show (id) coloca el mismo el id y va a mostrar el gatos
#con ese id

#hacer restfull bird


















get '/cats' do
  erb :'cats/index'
end

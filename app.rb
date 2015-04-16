require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'pg'
require 'rake'

#################### RABL ###########################
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'

# Register RABL
Rabl.register!

# Render RABL
get "/" do
  @foo = # ...
  rabl :foo, :format => "json"
  # or render :rabl, :foo, :format => "json"
  # or Rabl::Renderer.json(@foo, 'path/foo/index', view_path: 'app/views')
end

#########################################################

#################  Configure DB  #######################

db = URI.parse('postgres://johnreaganmoore:pass@localhost/faq')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

#########################################################

class Question < ActiveRecord::Base
end


get '/' do
	@questions = Question.order("created_at DESC")

	erb :index
end

get '/new' do
	erb :new
end

post "/new" do
	@question = Question.new(params[:note])
	if @question.save
		redirect "question/#{@question.id}"
	else
		erb :new
	end
end

get "/question/:id" do
	@question = Question.find_by_id(params[:id])
	erb :question
end
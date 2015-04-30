require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'pg'
require 'rake'
require 'haml'

#################### RABL ###########################
require 'rabl'
require 'oj'
require 'active_support'
require 'builder'

# Register RABL
Rabl.register!

#########################################################

#Required routes
require_relative 'routes/questions'
require_relative 'routes/answers'

#Require models
require_relative 'models/questions'
require_relative 'models/answers'





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

set :haml, :format => :html5


#Get all questions
get '/', :provides => [:json] do
	@questions = Question.order("created_at DESC")

	rabl :'questions/index', :format => "json"
end

#Get all questions
get '/questions', :provides => [:json] do
	@questions = Question.order("created_at DESC")

	rabl :'questions/index', :format => "json"
end

#Get question by id
get "/questions/:id", :provides => [:json] do
  @question = Question.find_by_id(params[:id])
  rabl :'questions/show', :format => "json"
  
end

# #Get form for creating new question
# get '/new' do
# 	haml :'questions/new'
# end

#Alternate route for new question form
get '/questions/new' do
	haml :'questions/new', :format => "html5"
end

# Create a new question
post '/questions/create', :provides => [:json] do
  @question = Question.new
  @question.update_attribute(:label, params[:label])
  @question.save
  status 201
  rabl :'questions/show', :format => "json"
end

# Create a new question on post verb to /questions
post '/questions', :provides => [:json] do
  @question = Question.new
  @question.update_attribute(:label, params[:label])
  @question.save
  status 201
  rabl :'questions/show', :format => "json"
end

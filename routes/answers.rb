#Get all answers

get '/answers', :provides => [:json] do
	@answers = Answer.order("created_at DESC")

	rabl :'answers/index', :format => "json"
end

# Get answer(s) for a question
get '/questions/:id/answer', :provides => [:json] do

end

#Get answer by id
get "/answers/:id", :provides => [:json] do
  @answer = Answer.find_by_id(params[:id])
  rabl :'answers/show', :format => "json"
  
end

#Get form for creating new answer
get '/new' do
	haml :new
end

#Alternate route for new answer form
get '/answers/new' do
	haml :new
end

# Create a new answer
post '/answers/new', :provides => [:json] do
  @answer = Answer.new
  @answer.update_attribute(:label, params[:label])
  @answer.save
  status 201
  rabl :'answers/show', :format => "json"
end
get '/', :provides => [:json] do
	@questions = Question.order("created_at DESC")

	rabl :'questions/index', :format => "json"
end

get '/questions', :provides => [:json] do
	@questions = Question.order("created_at DESC")

	rabl :'questions/index', :format => "json"
end

get "/questions/:id", :provides => [:json] do
  @question = Question.find_by_id(params[:id])
  rabl :'questions/show', :format => "json"
  
end


################

get '/new' do
	haml :'/questions/new'
end

get '/questions/new' do
	haml :'/questions/new'
end

# Create a new question
post '/questions/new', :provides => [:json] do
  @question = Question.new
  @question.update_attribute(:label, params[:label])
  @question.save
  status 201
  rabl :'questions/show', :format => "json"
end

################

# post "questions/new" do
# 	@question = Question.new(params[:note])
# 	if @question.save
# 		redirect "question/#{@question.id}"
# 	else
# 		erb :'questions/new'
# 	end
# end
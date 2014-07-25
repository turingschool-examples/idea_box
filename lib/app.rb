require 'idea_box'

class IdeaBoxApp < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'

  not_found do
    erb :error
  end

  get '/' do
    erb :index, locals: {ideas: IdeaStore.all.sort, idea: Idea.new(params)}
  end

  get '/existing' do
    erb :existing, locals: {ideas: IdeaStore.all.sort, idea: Idea.new(params)}
  end

  post '/' do
    IdeaStore.create(params[:idea])
    redirect '/existing'
  end

  delete '/:id' do |id|
    IdeaStore.delete(id.to_i)
    redirect '/existing'
  end

  get '/:id/edit' do |id|
    idea = IdeaStore.find(id.to_i)
    erb :edit, locals: {ideas: IdeaStore.all.sort, idea: Idea.new(params)}
  end

  put '/:id' do |id|
    IdeaStore.update(id.to_i, params[:idea])
    redirect '/existing'
  end

  post '/:id/like' do |id|
    idea = IdeaStore.find(id.to_i)
    idea.like!
    IdeaStore.update(id.to_i, idea.to_h)
    redirect '/existing'
  end

  helpers do
    def format_rank(idea)
      "Rank: #{idea.rank}"
    end
  end

end

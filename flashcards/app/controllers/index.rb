get '/' do
  erb :index
end

get '/decks' do
  @decks = Deck.all
  erb :decks
end

post '/decks' do
  @decks =Deck.all
  erb :decks
end

post '/' do
  if params[:email]
    new_user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  end
  p User.find_by(user_name: params[:user_name])
  user = User.authenticate(params[:user_name], params[:password])
  if user
    redirect '/decks'
  else
    redirect '/'
  end
end

get '/decks/:deck_id/:card' do
  @deck = Deck.find(params[:deck_id]).cards
  p params[:card]
  @card = @deck[params[:card].to_i]
  @deck_id = params[:deck_id]
  @card_id = params[:card].to_i

  erb :card
  end

post '/decks/:deck_id/:card'  do
  @deck_id = params[:deck_id]

  @deck = Deck.find(params[:deck_id]).cards

  @card = @deck[params[:card].to_i]
  if params['guess'].upcase == @card.answer.upcase
    @msg = "CORRECT!"
    @card_id = params['card'].to_i + 1
    @card = @deck[@card_id]
    if @card_id >= @deck.length
      @msg = "done"
    end
  else
    @msg = "Sorry, try again."
    @card_id = params['card'].to_i
  end
  @msg
end

get '/stat' do
  erb :stat
end

not_found do
  erb :error
end


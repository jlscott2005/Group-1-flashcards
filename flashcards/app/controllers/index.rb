get '/' do
  erb  :decks
end

get '/decks' do
  @decks = Deck.all
  @decks
  erb :decks
end

get '/decks/:deck_id/:card' do
  @deck = Deck.find(params[:deck_id]).cards

  @card = @deck[params[:card].to_i]
  @deck_id = params[:deck_id]
  @card_id = params[:card].to_i
  erb :card
end

post '/decks/:deck_id/:card' do
  @deck_id = params[:deck_id]
  @deck = Deck.find(params[:deck_id]).cards

  @card = @deck[params[:card].to_i]
  if params[:guess].upcase == @card.answer.upcase
    @msg = "CORRECT!"
    @card_id = params[:card].to_i + 1
    @card = @deck[@card_id]
  else
    @msg = "Sorry, try again."
    @card_id = params[:card].to_i
  end
  erb :card
end

get '/stat' do
  erb :stat
end


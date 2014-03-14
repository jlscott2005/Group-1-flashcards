get '/' do
  erb  :decks
end

get '/decks/:deck_id/:card' do
  @deck = Deck.find(params[:deck_id]).cards
  @card = @deck[params[:card].to_i]
  @deck_id = params[:deck_id]
  @card_id = params[:card].to_i + 1
  erb :card
end

post '/decks/:deck_id/:card' do
  @deck_id = params[:deck_id]
  @deck = Deck.find(params[:deck_id]).cards
  @card = @deck[params[:card].to_i]
  @card_id = params[:card].to_i + 1
  erb :card
end

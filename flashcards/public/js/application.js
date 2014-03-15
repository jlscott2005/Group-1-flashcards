$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  var deckID = function(string) {
    return string.match(/deck_id=(\d)+/)[1];
  };

  var cardID = function(string) {
    return string.match(/card=(\d)+/)[1];
  };

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#guess').on("submit", function(event){
      event.preventDefault();
      var result = $(this).serialize();
      var url = '/decks/' + deckID(result) + '/' + cardID(result);
      $.post(url, result, function(response) {
        $('#msg').text(response);

        if ($('#msg').text() == "CORRECT!")
        {
          setTimeout(function () {
            newCard = parseInt(cardID(result)) + 1
            var url = '/decks/' + deckID(result) + '/' + newCard;
            window.location.href = url;
          },2000);
         }
        else if ($('#msg').text() == 'done')
        {
          window.location.href = '/stat';
        }
      });
  });










});

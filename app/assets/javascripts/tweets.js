$('newTweet').on('click', function() {
$.ajax({
  url: '/tweets',
  dataType: 'JSON',
  method:   'POST',
  data: {
     tweet: {
       message: $('#tweet_message').val(),
       user_id: $('#tweet_user_id').val()
     }
   },
   success: function (response) {
     $('#tweet_message').val('');
     $('#tweet_user_id').val('');
     $('.new_tweet').prepend('<h2>Tweet Sent!</h2>');

// textarea の高さ自動調整
/*global $*/
$(function() {
  var $textarea = $('#post_body');
  var lineHeight = parseInt($textarea.css('lineHeight'));
  $textarea.on('input', function(e) {
    var lines = ($(this).val() + '\n').match(/\n/g).length;
    $(this).height(lineHeight * lines);
  });
  console.log($textarea)
});
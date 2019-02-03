$(function () {
  var test = $('.uk-subnav .li:eq(0) a');
  console.log(test);
  
  $('.uk-subnav .li:eq(0) a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });
  
});

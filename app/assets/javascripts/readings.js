$(document).ready(function($){
  var timeDateElement = $('.moment')[0];
  var timeDate = timeDateElement.innerText;
  timeDate = moment(timeDate).tz('Asia/Hong_Kong').format('MMMM Do YYYY, h:mm:ss a');
  console.log(timeDate);
  timeDateElement.html(timeDate);
});

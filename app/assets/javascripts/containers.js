$(window).resize(function () {
  if ($(window).width() > 919)  {
    $(".exclude").removeAttr("style");
    $("#reveal-this").removeAttr("style");
    $(".exclude1").removeAttr("style")
  }
  else {
    $(".exclude1").css("display", "none");
  }
});

$(document).ready(function ()  {
  $("#staging-link").on("click", function () {
    $("#reveal-this").css('display', 'inline-table');
    $("#staging-link").css('display', 'none');
    $("#staging-link-2").css('display', 'inline');
  });

  $("#staging-link-2").on("click", function () {
    $("#reveal-this").css('display', 'none');
    $("#staging-link").css('display', 'inline');
    $("#staging-link-2").css('display', 'none');
  });
});
$('.info-pop').popover({trigger: 'hover'});


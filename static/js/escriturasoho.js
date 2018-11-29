// Click en boton pref
$("#preference-button").on("click", function() {
  $('#outer-box').transition('slide down');

})


// Mostrar box pref y boton pref
$( document ).ready(function() {
  $("#preference-link").hide();
  $("#preference-button").show();
  $('#outer-box').transition('slide down');
  setTimeout(function(){ saySomething(true, "Bienvenido"); }, 500);
});

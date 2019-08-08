$( document ).on('turbolinks:load', function() {
  $(".show_seat").hide();
  $("#reservation_date").on("change", function(){
  $(".show_seat").show();
    var date = this.value;
    var bus_id = $("#new_reservation").find("input[name='bus_id']").val();
    var params = {
        bus_id: bus_id,
        date: date
      };
    $.ajax({
      method: "GET",
      url: "/book_bus_seats/show",
      type: "script",
      data: params,
      success: function(){

      },
      error: function(){

      },
      complete: function(){

      }
    });
  })
})

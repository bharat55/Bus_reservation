$( document ).on('turbolinks:load', function() {
  $("#reservation_date").on("change", function(){
    var date = this.value;
    var bus_id = $("#new_reservation").find("input[name='bus_id']").val();

    $.ajax({
      url: "/load_reservation_seats",
      method: "GET",
      type: "script",
      data: {
        bus_id: bus_id,
        date: date
      }
    });
  })
})

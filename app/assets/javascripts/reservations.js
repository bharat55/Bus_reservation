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
      url: "/book_bus_seats",
      type: "script",
      data: params,
      success: function(){

      },
      error: function(){

      },
      complete: function(){

      }
    });
  });


  $(document).on("change", "#reservation_total_seats",function(){
    $(".single_seat").filter("[data_already_selected=false]")
      .prop("disabled", false).prop("checked", false);
  });

  $(document).on("click", ".single_seat", function(){
    var totalSeats = $("#reservation_total_seats").val();

    if(!totalSeats){
      alert("please put the total seats first then select the seat !!!");
      return false;
    }
    if($(".single_seat:checked:not(:disabled)").length == totalSeats){
      $(".single_seat:not(:checked)").prop("disabled", true);
    }
    else{
      $(".single_seat:disabled").filter("[data_already_selected=false]")
        .prop("disabled", false);
    }
  });




    $('.timer').startTimer({
      onComplete: function(element){
         window.location.assign("/");
      }
    });

});

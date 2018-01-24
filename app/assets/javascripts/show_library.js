$.ajax({
    type: "GET",
    url: window.location.href,
    dataType: "json",
    success: function(result){
      console.log(result);
      var data = result.library;
      console.log(window.location.href);
      console.log(result);
      var row = '<tr><td> ' + data.name + ' </td> <td> ' + data.address + ' </td> <td>' + data.phone_no;
      $(".library-show").append(row);
    }
  });
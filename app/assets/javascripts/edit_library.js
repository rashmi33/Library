$.ajax({
    type: "PUT",
    url: window.location.href,
    dataType: "json",
    success: function(result){
      var data = result.library;
      console.log(window.location.href);
      var row = '<tr><td> ' + data.name + ' </td> <td> ' + data.address + ' </td> <td>' + data.phone_no;
      $(".library-edit").append(row);
    }
  });
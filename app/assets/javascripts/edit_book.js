$.ajax({
    type: "PUT",
    url: window.location.href,
    dataType: "json",
    success: function(result){
      var data = result.book;
      console.log(window.location.href);
      var row = '<tr><td> ' + item.name + ' </td> <td> ' + item.author + ' </td> <td>' + item.code + ' </td> <td>' + item.price + ' </td> <td>' + item.version + '</td><td>' + item.no_of_copies;
      $(".book-edit").append(row);
    }
  });
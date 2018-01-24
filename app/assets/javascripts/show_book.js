$.ajax({
    type: "GET",
    url: window.location.href,
    dataType: "json",
    success: function(result){
      var data = result.book;
      console.log(data);
      var row = '<tr><td> ' + data.name + ' </td> <td> ' + data.author + ' </td> <td>' + data.code + ' </td> <td>' + data.price + ' </td> <td>' + data.version + '</td><td>' + data.no_of_copies;
      $(".book-show").append(row);
    }
  });
$.ajax({
  type: "GET",
  url: "/books",
  dataType: "json",
  success: function(result){
  	var data = result.books;
    $.each(data, function (i, item) {
      var row = '<tr><td> ' + item.name + ' </td> <td> ' + item.author + ' </td> <td>' + item.code + ' </td> <td>' + item.price + ' </td> <td>' + item.version + '</td><td>' + item.no_of_copies +
      '</td><td><button onclick="show_book(' + data[i].id + ')">Show</button></td><td>' +
      '<button onclick="edit_book(' + data[i].id + ')">Edit</button></td><td>' + 
      '<button onclick='+'"delete_book('+ data[i].id + ')">Delete</button></td><tr>';
      $(".book").append(row);
    }); 
    console.log(data);
  }
});

function show_book(id){
  console.log(id);
  //$('.show-page').removeClass('hidden');
  //$('.containter-index').addClass('hidden');
  window.open("/books/"+ id, "show.html.erb");
}

function edit_book(id){
  console.log(id);
  window.open("/books/"+ id, "edit.html.erb");
}

function delete_book(id){
  console.log(id);
  $.ajax({
    type: "POST",
    url: "/books/" + id,
    dataType: "json",
    data: {"_method": "delete"}
  });
  window.location.reload(true);
}



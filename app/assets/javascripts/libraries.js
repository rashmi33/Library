function library(name, address, phone_no){
	this.name = name;
	this.address = address;
	this.phone_no = phone_no;
}

$.ajax({
  type: "GET",
  url: "/libraries",
  dataType: "json",
  success: function(result){
  	var data = result.libraries;
    $.each(data, function (i, item) {
      var row = '<tr><td> ' + item.name + ' </td> <td> ' + item.address + ' </td> <td>' + item.phone_no + 
      '</td><td><button onclick="show_library(' + data[i].id + ')">Show</button></td><td>' +
      '<button onclick="edit_library(' + data[i].id + ')">Edit</button></td><td>' + 
      '<button onclick='+'"delete_library('+ data[i].id + ')">Delete</button></td><tr>';
      $(".library").append(row);
    }); 
    console.log(data);
  }
});

function show_library(id){
  console.log(id);
  //$('.show-page').removeClass('hidden');
  //$('.containter-index').addClass('hidden');
  window.open("/libraries/"+ id, "show.html.erb");
}

function edit_library(id){
  console.log(id);
  window.open("/libraries/"+ id, "edit.html.erb");
}

function delete_library(id){
  console.log(id);
  $.ajax({
    type: "POST",
    url: "/libraries/" + id,
    dataType: "json",
    data: {"_method": "delete"}
  });
  window.location.reload(true);
}



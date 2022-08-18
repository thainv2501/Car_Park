/**
 * 
 */


document.addEventListener("DOMContentLoaded", function() {
	console.log("window loaded");
	listEmployee(1);
});

function listEmployee(page) {
	$.ajax({
		type: "GET",
		url: "/Car_Park/listEmployee?page=" + page,
		data: {
		}
		,
		success: function(data) {
			$('.right').html(data);
		},
		error: function(data) {
			$("#resultarea").text(data);
		}
	})
}



function addEmployee() {
	$.ajax({
		type: "GET",
		url: "/Car_Park/addEmployee",
		data: {
		}
		,
		success: function(data) {
			$('.right').html(data);
		},
		error: function(data) {
			$("#resultarea").text(data);
		}
	})
}


document
	.getElementsByClassName("add_employee_form")[0]
	.addEventListener("submit", function(event) {
		const items = document.querySelectorAll(".required");
		items.forEach((item) => {
			let node = item.parentElement.getElementsByClassName("warning")[0];
			if (item.value == "") {
				event.preventDefault();
				node.classList.remove("hide");
				// td.innerHTML += '<p class="warning"> eeeeeeeeeeeeeeeeee</p>';
				console.log(item.parentElement.getElementsByClassName("warning")[0]);
			}
			if (item.value != "") {
				node.classList.add("hide");
			}
		});
		console.log(event.target);
	});


  function addEmployee(){
$.ajax({
  type: "GET",
  url: "/Car_Park/addEmployee",
  data: {
  }
  ,
  success: function(data){
	$('.right').html(data);
  },
  error: function(data){
     $("#resultarea").text(data);
  }
})	
}
 
 



function checkPhone(event) {
	let phone = event.value;
	let regex = /^\d{10}$/;
	let node = event.parentElement.getElementsByClassName("wrong_format")[0];
	if (!phone.match(regex)) {
		node.classList.remove("hide");
		console.log(event);
	} else {
		node.classList.add("hide");
	}
}
function checkEmail(event) {
	let email = event.value;
	let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/g;
	let node = event.parentElement.getElementsByClassName("wrong_format")[0];
	if (!email.match(regex)) {
		node.classList.remove("hide");
		console.log(event);
	} else {
		node.classList.add("hide");
	}
}
function checkPassword(event) {
	let password = event.value;
	let regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/g;
	let node = event.parentElement.getElementsByClassName("wrong_format")[0];
	if (!password.match(regex)) {
		node.classList.remove("hide");
		console.log(event);
	} else {
		node.classList.add("hide");
	}
}

function displayDropdownList(event) {
	const dropDown = event.parentElement;
	const dropdownList = dropDown.getElementsByClassName("dropdown-list")[0];
	dropdownList.classList.toggle("show");
	console.log(dropdownList);
}

document.getElementById("back_btn").addEventListener("click", () => {
	history.go(-1);
});
document.getElementById("reset_btn").addEventListener("click", () => {
	let items = document.getElementsByTagName("input");
	console.log(items);
	for (let index = 0; index < items.length; index++) {
		const element = items[index];
		element.value = "";
		console.log(element);
	}
});


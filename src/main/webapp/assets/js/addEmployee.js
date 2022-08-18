/**
 * 
 */
 
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
            	
            	
            	 document
            	  .getElementsByClassName("add_employee_form")[0]
            	  .addEventListener("submit", function (event) {
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
            	 
            	 function setMaxDate(){
            		    const published_date = document.getElementsByClassName("dob")[0];
            		    console.log(published_date);
            		    let today = new Date();
            		    let todayString = today.getFullYear() + "-" + (today.getMonth() < 10 ? '0' + (today.getMonth() + 1) : (today.getMonth() + 1)) + "-" + (today.getDate() < 10 ? '0' + today.getDate() : today.getDate())
            		    published_date.max = todayString;   
            		}

            		setMaxDate();


/**
 * 
 */
 
 document.getElementById("filter_form").addEventListener("submit",function(event){
    	 event.preventDefault();
         let search_text = event.target.getElementsByClassName('search_input')[0].value;
    	 console.log(search_text)
    $.ajax({
      type: "post",
      url: "/Car_Park/listEmployee",
      data: {
	    search_text : search_text,
	    
      }
      ,
      success: function(data){
    	$('.right').html(data);
      },
      error: function(data){
         $("#resultarea").text(data);
      }
    })
    })

    
     document.getElementById("pre").addEventListener("click",function(){
	console.log("work");
    $.ajax({
      type: "GET",
      url: "/Car_Park/listEmployee?action=pre",
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
    })
    
    
    
    document.getElementById("next").addEventListener("click",function(){
	console.log("work");
    $.ajax({
      type: "GET",
      url: "/Car_Park/listEmployee?action=next",
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
    })
    
    
    
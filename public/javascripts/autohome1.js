var current_facility_id;


$(document).bind("mobileinit", function(){
  $.mobile.defaultPageTransition = "slide";
});


function update_facility( type, id, mode, ctlr, dpin, name ){
    /*alert("Setting " + type + " " + id + " to " + mode);*/
    $.ajax({
        // the URL for the request
        url: "/api/update/facility",
    
        // the data to send (will be converted to a query string)
        data: {
            type: type,
            id: id,
            ctlr: ctlr,
            name: name,
            dpin: dpin,
            mode: mode
        },
    
        // whether this is a POST or GET request
        type: "GET",
    
        // the type of data we expect back
        dataType : "json",
    
        // code to run if the request succeeds;
        // the response is passed to the function
        success: function( json ) {
            /*$( "<h1/>" ).text( json.title ).appendTo( "body" );
            $( "<div class=\"content\"/>").html( json.html ).appendTo( "body" );*/
            //alert( json.result );
        },
    
        // code to run if the request fails; the raw request and
        // status codes are passed to the function
        error: function( xhr, status, thrown ) {
            alert( "There was an error!  Server said '" + thrown + "'" );
        },
        
        // code to run regardless of success or failure
        complete: function( xhr, status ) {
            /*alert( "The request is complete!" );*/
        }
    });

}
function new_facility(){
    $.ajax({
        url: "/api/new/facility",
        data: {},
        type: "GET",
        dataType : "json",
        success: function( json ) {
            alert( json.result );
        },
        error: function( xhr, status, thrown ) {
            alert( "There was an error!  Server said '" + thrown + "'" );
        },
    });

}
function update_connection( type, id, mode ){
    /*alert("Setting " + type + " " + id + " to " + mode);*/
    $.ajax({
        // the URL for the request
        url: "/api/update",
    
        // the data to send (will be converted to a query string)
        data: {
            type: type,
            id: id,
            mode: mode
        },
    
        // whether this is a POST or GET request
        type: "GET",
    
        // the type of data we expect back
        dataType : "json",
    
        // code to run if the request succeeds;
        // the response is passed to the function
        success: function( json ) {
            /*$( "<h1/>" ).text( json.title ).appendTo( "body" );
            $( "<div class=\"content\"/>").html( json.html ).appendTo( "body" );*/
            //alert( json.result );
        },
    
        // code to run if the request fails; the raw request and
        // status codes are passed to the function
        error: function( xhr, status, thrown ) {
            alert( "Sorry, there was a problem! " + status + " " + thrown );
        },
        
        // code to run regardless of success or failure
        complete: function( xhr, status ) {
            /*alert( "The request is complete!" );*/
        }
    });

}



$(document).ready(function(){  

    $( "input" ).change(function () {
        add_handlers1( $(this) );
    });

    $( "input" ).each( function () {
        add_handlers2( $(this) );
    });

    $( "select" ).change(function () {
        update_facility_vals( $(this) );
    });

    $("a.Facility").on( "click", function () {
        current_facility_id = get_id($(this));
        $("#facility_name").text(get_facility_name(current_facility_id));
    });
    $("#delButton").on( "click", function () {
        $.ajax({
            url: "delete/facility",
            data: { id: current_facility_id },
            type: "GET",
            dataType : "json",
            success: function( json ) {
                $( "#collapse-"+current_facility_id ).remove();
            },
            error: function( xhr, status, thrown ) {
                alert( "There was an error!  Server said '" + thrown + "'" );
            },
        });
    });

    $("#addNewButton").on( "click", function () {
        //new_facility();
        $.ajax({
            url: "add/facility",
            data: {},
            type: "GET",
            dataType : "json",
            success: function( json ) {
                new_id = json.result;
                $("form").append(new_facility.replace(/99999999/g,new_id));
                $("form").trigger('create');
                $( "input" ).change(function () { add_handlers1( $(this) ); });
                $( "input" ).each( function () { add_handlers2( $(this) ); });
                $( "select" ).change(function () { update_facility_vals( $(this) ); });
                $("a.Facility").on( "click", function () {
                    current_facility_id = get_id($(this));
                    $("#facility_name").text(get_facility_name(current_facility_id));
                });
            },
            error: function( xhr, status, thrown ) {
                alert( "There was an error!  Server said '" + thrown + "'" );
            },
        });
    });
})  

function add_handlers1( $obj ){
    var id = get_id($obj);
    if( $obj.attr( "name" ) == "cb-manual-"+id ){
        enable_slider( $obj, "#flip-manual-");
    }
    if( $obj.attr( "name" ) == "name-"+id ){
        inner = $( "#head-"+id ).find('.ui-collapsible-heading-status').html();
        $( "#head-"+id ).find('.ui-btn-text').html( $obj.val() + "<span class=\"ui-collapsible-heading-status\"> " + inner + "</span>" );
    }
    update_facility_vals( $obj );
}

function add_handlers2( $obj ){
    if( $obj.attr( "name" ) == "cb-manual-"+get_id($obj) ){
        enable_slider( $obj, "#flip-manual-");
    }
}

function get_facility_name(id){
    alert( $.prototype.jquery );
    name = $( "#head-"+id ).find('.ui-btn-text').html();
    name = name.replace(/<span.*>/g,"");
    return name;
}



function enable_slider( $obj, name ){
    var id = $obj.attr("id");
    var n=id.split("-");
    id = n[n.length-1];
    if( $obj.attr( "type" ) == "checkbox" ){
        if( $obj.is( ":checked" ) ){
            $( name+id).slider('enable');
        } else {
            $( name+id ).slider('disable');
        }
    }
}

function update_facility_vals( $obj ){
    var type = $obj.attr("class");
    var n = type.split(" ");
    type = n[0];
    var id = $obj.attr("id");
    n=id.split("-");
    id = n[n.length-1];
    var mode = "none";
    if( $( "#cb-manual-"+id ).is( ":checked" ) ){
        mode = $( "#flip-manual-"+id + " option:selected" ).val();
    }
    var ctlr = $( "#select-controller-"+id + " option:selected" ).val();
    var dpin = $( "#select-pin-"+id + " option:selected" ).val();
    var name = $( "#name-"+id ).val();
    update_facility( type, id, mode, ctlr, dpin, name);

}

function get_id( $obj ){
    var id = $obj.attr("id");
    var n=id.split("-");
    id = n[n.length-1];
    return id;
}

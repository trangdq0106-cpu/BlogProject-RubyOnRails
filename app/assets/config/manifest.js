//= link_tree ../images
//= link_directory ../stylesheets .css
//= link_tree ../../javascript .js
//= link_tree ../../../vendor/javascript .js

$(document).on("click", ".tabledit-edit-button", function () {
    var Idimp = $(this).data('data-curated-id');
    $(".modal-content #data_curated_id").val(Idimp)
    $('#myModal').modal('show');  
});




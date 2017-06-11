jQuery(document).ready(function() {

    // This will create a single gallery from all elements that have class "gallery-item"
    jQuery('.gallery-item').magnificPopup({
        type: 'image',
        gallery:{
            enabled:true
        }
    });
});
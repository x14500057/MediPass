$(document).on('turbolinks:load', function() {
  // when a post is clicked, show its full content in a modal window
  $("body").on( "click", ".medical_record-row", function() {
    var issued_by = $(this).find('.medical_record-issued-by').html();
    var diagnostic = $(this).find('.medical_record-diagnostic').html();
    var symptoms = $(this).find('.medical_record-symptoms').html();
    // var interested = $(this).find('.post-content .interested').attr('href');
    $('.modal-header .medical_record-issued-by').text("Dr. "+issued_by);
    $('.loaded-data #modal-diagnostic').text(diagnostic);
    $('.loaded-data modal-symptoms').text(symptoms);
    // $('.loaded-data .modal-actions #edit-emer').attr('href', interested);
    $('.myModal').modal('show');
  });
});
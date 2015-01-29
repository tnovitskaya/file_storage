$(function(){
  var uploader = new plupload.Uploader({
    runtimes : "html5",
    browse_button : 'pickfiles',
    max_file_size : '10mb',
    url : "/upload",
    multipart: true,
    urlstream_upload: true,
    multipart_params: {
     "authenticity_token" : $('#token').val()
    }
  });

  uploader.bind('FilesAdded', function(up, files) {
    $.each(files, function(i, file) {
      $('#filelist').append(
        '<div id="' + file.id + '">' +
        'File: ' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b>' +
        '</div>'
        );
      });
    });

  uploader.bind('UploadProgress', function(up, file) {
    $('#' + file.id + " b").html(file.percent + "%");
  });

  uploader.bind('FileUploaded', function(up, file) {
    $('#' + file.id + "  b").html("OK");
  });

  $('#uploadfiles').click(function(e) {
    uploader.start();
    e.preventDefault();
  });

  uploader.init();
});
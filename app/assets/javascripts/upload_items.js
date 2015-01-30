$(function(){
  var uploader = new plupload.Uploader({
    runtimes : "html5",
    browse_button : $('.select-files')[0],
    max_file_size : '1 gb',
    url : "/upload",
    multipart: true,
    urlstream_upload: true,
    multipart_params: {
     "authenticity_token" : $('#token').val()
    }
  });

  uploader.bind('FilesAdded', function(up, files) {
    $.each(files, function(i, file) {
      $('.files-list tbody').append(
        '<tr id="' + file.id + '">' +
          '<td>' + file.name + '</td>' +
          '<td>' + plupload.formatSize(file.size) + '</td>' +
          '<td class="status"><div class="progress"><div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div></div></td>' +
        '</tr>'
        );
      });
    });

  uploader.bind('UploadProgress', function(up, file) {
    $('#' + file.id).find('.progress-bar').css('width', file.percent + '%');
  });

  uploader.bind('FileUploaded', function(up, file) {
    //$('#' + file.id + " .status").html("OK");
  });

  $('.upload-files').click(function() {
    uploader.start();
  });

  $('.stop-upload').click(function() {
    uploader.stop();
  });

  uploader.init();
});
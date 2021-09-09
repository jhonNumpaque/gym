if ('loading' in HTMLImageElement.prototype) {
    console.log('Browser support `loading`...');
} else {
    console.log('Not supported');
}

$('#flash-overlay-modal').modal('show');
// $('div.alert').not('.alert-important').delay(3000).fadeOut(350);

function getDataUser () {
    var id = $('#id').val();
    if (id) {
        $.get('../getData/', { id: id }, function(data) {
            var xData = JSON.parse(data);
            $('#id').val(id);
            $('#tipodoc').val(xData['tipo_doc']);
            $('#rh').val(xData['rh']);
            $("#sede").val(xData['sede']);
        });
    }
}

getDataUser();

$('#pago').on('shown.bs.modal', function(event) {
    var button = $(event.relatedTarget);
    var persona = button.data('per');
    $("#personaId").val(persona);
    $.get('getPay/' + persona, function(data) { $("#tbPays > tbody").html(data); });
});


$('#filtro').keyup(function(event) {
    var val = $('#filtro').val();

    if(val.length > 1) {
        $.get('../filter/'+val, function(data) {
            if (data) {
                $("#dataPersonas").replaceWith(data);
                $("#pagging").hidden();
            }
        });
    }
});


$("#register_user").click(function() {
    if ($("#register_user").is(':checked')) {
        $('#password, #password-confirm').prop( "disabled", false);
    } else {
        $('#password, #password-confirm').prop( "disabled", true );
    }
});

$('#plan').change(() => {
    var planId = $('#plan').val();
    if ( planId.length > 0 ) {$.get('../getValueTimeDur/' + planId, (data)  => { $('#duracion').val(data); }); }
});

function getDataConcept(id) {
    $.get('getDataConceptId/' + id, function(data) {
        var obj = JSON.parse(data);
        $("#id").val(obj.id);
        $("#nombre").val(obj.nombre);
    });
}

function sum() {
    var fecha = moment($('#fecha').val());
    var nmes = $("#duracion").val();
    var pago = fecha.add(nmes, 'M');
    $("#fecha_vec").val(pago.format('YYYY-MM-DD'));
}

$('#fecha').on('input change', function (){
    var startDate = $('#fecha').val().replaceAll('-', '/');
    var time = $('#duracion').val();
    if (startDate.length === 10 && time.length > 0) {
        var EndDate = moment(startDate).add(time, 'M').locale('es').format('YYYY-MM-DD');
        $('#fecha_vec').val(EndDate);
    }
});

function isValidDate(date) {
    return date && Object.prototype.toString.call(date) === "[object Date]" && !isNaN(date);
}

function addMonths(date, value) {
    let current = new Date(date);
    current.setMonth((current.getMonth()) + parseInt(value));
    return current.getFullYear() + "-" + current.getMonth() + "-" + (current.getDate() < 10 ? "0" + current.getDate() : current.getDate());
}

$('#fecha_i').val(moment().format('YYYY-MM-DD'));


function getDataIngreso(id) {
    $.get('ObtenerIngreso/' + id, function(data) {
        var obj = JSON.parse(data);
        $("#id").val(obj.id);
        $("#fecha_i").val(obj.fecha);
        $("#concepto").val(obj.concepto);
        $("#valor").val(obj.valor);
    });
}

function getDataEgreso(id) {
    $.get('ObtenerEgreso/' + id, function(data) {
        var obj = JSON.parse(data);
        $("#id").val(obj.id);
        $("#concepto").val(obj.concepto);
        $("#fecha_i").val(obj.fecha);
        $("#valor").val(obj.valor);
    });
}

function sum_info() {
    var fecha = moment($('#fechaInicial').val());
    var pago = fecha.add(1, 'M');
    $("#fechaFinal").val(pago.format('YYYY-MM-DD'));
}

$(function(){
    'use strict';

    var $image = $("#image-user");
    // Options crop image
    var URL = URL = window.URL || window.webkitURL;
    var uploadedImageName;
    var uploadedImageType;
    var uploadedImageURL;

    var options = {
        minSize : [160,90],
        autoCropArea: 0.8,
        preview: '.img-preview',
        responsive: true,
        imageSmoothingEnabled: true,
        imageSmoothingQuality: 'medium',
        aspectRatio: 1,
        preserveAspectRatio : true,
        scalable:true,
        zoomable:true,
        zoomOnTouch:true,
        zoomOnWheel:true,
        cropBoxMovable:true,
        cropBoxResizable:true,
        dragMode: 'crop'
    };

    // Cropper
    $image.cropper(options).on({
        crop: function (e) {
            $image.data('cropper').getCroppedCanvas().toBlob((blob) => {
                ReaderImage(blob).then((data) => {
                    $("#file").val(data);
                });
            });
        },
    });

    if (!$.isFunction(document.createElement('canvas').getContext)) {
        $('button[data-method="getCroppedCanvas"]').prop('disabled', true);
    }

    // Import Image
    var $inputImage = $("#foto");

    if (URL) {
        $inputImage.change(function () {
            var files = this.files;
            var file;

            if (!$image.data('cropper')) {
                return;
            }

            if (files && files.length) {
                file = files[0];

                if (/^image\/\w+$/.test(file.type)) {
                    uploadedImageName = file.name;
                    uploadedImageType = file.type;

                    var extension = uploadedImageName.replace(/^.*\./, '');

                    $("#fileType").val(extension);

                    if (uploadedImageURL) {
                        URL.revokeObjectURL(uploadedImageURL);
                    }

                    uploadedImageURL = URL.createObjectURL(file);
                    $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                } else {
                    window.alert('Please choose an image file.');
                }
            }
        });
    } else {
        $inputImage.prop('disabled', true).parent().addClass('disabled');
    }

    function ReaderImage(blob) {
        return new Promise((resolve, reject) => {
            var reader = new FileReader();

            reader.readAsDataURL(blob);

            reader.onloadend = () => {
                resolve(reader.result);
            }

            reader.onerror = (err) => {
                console.log('Failed read due to error', err);
                reject(err);
            }
        });
    }

    $(document).bind("contextmenu",function(e){
        return false;
    });
});

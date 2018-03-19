$(document).on "ajax:beforeSend", "#emails-form", () ->
    console.log('Envio del forulario')
$(document).on "ajax:success", "#emails-form"
$(document).on "ajax:error", "#emails-form"
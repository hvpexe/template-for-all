$('#confirm-box .gray-box').click(function (e) {
    $('#confirm-box').css('scale', '0 0');
});
$('#confirm-box .no').click(function (e) {
    $('#confirm-box').css('scale', '0 0');
});
$("#confirm-box .yes").click(function (e) {
    console.log(typeof templatePrice);
    console.log(typeof templateId + templateId);
    $.ajax({
        url: 'BuyTemplate',
        data: {
            price: templatePrice,
            templateId: templateId,
        },
        success: function (data) {
            console.log(data);
            $('#confirm-box .container > div').html(data);
            setTimeout(() => {
                window.location.href = window.location.href
            }, 2000);
        },
        error: function (error) {
            $('#confirm-box .container > div').html("Ajax Error!");
        }
    });
});
function Buy(selector) {
    $(selector).css('scale', '1 1');
}

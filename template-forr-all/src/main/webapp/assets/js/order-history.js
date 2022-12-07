let selection = $('.selection');

changeTimeStamp = (e) => {
    if (selection.val() == 'all')
        $('[data-time]').removeClass('d-none');
    else
        $('[data-time]').each(function () {
            if (BigInt($(this).attr('data-time')) < BigInt(selection.val())) {
                $(this).removeClass('d-none');
            } else {
                $(this).addClass('d-none');
            }
        }
        );
}
;
selection.change((e) =>
{
    $(e.target).blur();
    changeTimeStamp()
});
changeTimeStamp();






let orderNum = $('#cacelgift').attr('data-ordernum');
$('cacelgift').on('click',function(){
    console.log('cancel click');
    alert('취소되었습니다');
    window.location.href="/pay/deleteorder?orderNum="+orderNum;
});

function cacelgift(){
    console.log('click');
    location.href="/pay/deleteorder?orderNum="+orderNum;
}
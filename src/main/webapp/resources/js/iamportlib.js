let p_num = $("#payBtn").attr("data-pnum");
let price2 = $("#payBtn").attr("data-price");
let p_name = $("#payBtn").attr("data-name");
let p_count = $("#payBtn").attr("data-count");
let user_num = $("#payBtn").attr("data-usernum");
let user = $("#payBtn").attr("data-user");
let email = $("#payBtn").attr("data-email");
let tel = $("#payBtn").attr("data-tel");
let addr_full = $("#payBtn").attr("data-addr");
let addr = addr_full.substring(addr_full.indexOf(',') + 1, addr_full.length);
let postcode = addr_full.substring(0, addr_full.indexOf(',') - 1);

$("#payBtn").click(function () {
    console.log(price2);
    console.log(addr);
    console.log(postcode);
    console.log("counnter : " + p_count);
    iamport(p_name, price2, email, user, tel, addr, postcode);
})
function iamport(p_name, price2, email, user, tel, addr, postcode) {
    let uid = "";
    IMP.init('imp22750372');
    IMP.request_pay({
        pg: 'nice.iamport00m',
        pay_method: 'card',
        merchant_uid: 'pp' + createOrderNum(),
        name: p_name,
        amount: 100,
        buyer_email: email
        // buyer_name: user,
        // buyer_tel: tel,
        // buyer_addr: addr,
        // buyer_postcode: postcode

    }, function (rsp) { // callback
        console.log(rsp);
        console.log(rsp.paid_amount);
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            alert(price);

            uid = rsp.imp_uid;
            // 결제검증
            $.ajax({
                url: '/pay/done',
                type: 'post',
                data: {
                    "imp_uid": rsp.imp_uid,
                    "orderNum": rsp.merchant_uid,
                    "P_Num": p_num, //상품번호
                    "P_Name": rsp.name,
                    "counter": p_count,
                    "totalPrice": price,
                    "memberNum": user_num // 회원번호 
                }
            }).done(function (data) {
                console.log("step1");
                // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
                if (price == data.response.amount) {
                    console.log("step2");
                    data = JSON.stringify({


                    });

                    jQuery.ajax({
                        url: "/pay/done",
                        type: "POST",
                        dataType: 'json',
                        contentType: 'application/json',
                        data: data
                    })
                        .done(function (res) {
                            console.log("step3");
                            if (res > 0) {
                                console.log(res);
                                console.log("success")
                                console.log("저장서오옹공");
                                // createPayInfo(uid);
                            }
                            else {

                                console.log(data);
                                console.log("fail to sace")
                            }
                        })
                }
                else {
                    alert('결제 실패');
                }
            })
        } else {
            //  swal("결제에 실패하였습니다.", "에러 내용: " + rsp.error_msg, "error");
            console.log("fail to pay process : " + rsp);
            console.log("fail to pay process : " + rsp.error_msg);
        }
    });
}

function createPayInfo(uid) {
    // 결제정보 생성 및 테이블 저장 후 결제완료 페이지로 이동 
    $.ajax({
        type: 'get',
        url: '/order/orderInfo',
        data: {
            'imp_uid': uid,
        },
        success: function (data) {

            swal('결제 성공 !', "결제완료 페이지로 이동합니다.", "success").then(function () {

                // 결제완료 페이지로 이동
                location.replace('/order/complete?payNum=' + data);

            })
        },
        error: function () {
            //    swal('결제정보 저장 통신 실패');
        }
    });
}

function createOrderNum() {
    const date = new Date();
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");

    let orderNum = year + month + day;
    for (let i = 0; i < 10; i++) {
        orderNum += Math.floor(Math.random() * 8);
    }
    return orderNum;
}
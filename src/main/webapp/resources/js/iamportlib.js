let p_num = $("#payBtn").attr("data-pnum");
let price = $("#payBtn").attr("data-price");
let p_name = $("#payBtn").attr("data-name");
let p_count = $("#payBtn").attr("data-count");
let memberNum = $("#payBtn").attr("data-usernum");
let user = $("#payBtn").attr("data-user");
let email = $("#payBtn").attr("data-email");
let tel = $("#payBtn").attr("data-tel");
let addr_full = $("#payBtn").attr("data-addr");
let addr = addr_full.substring(addr_full.indexOf(',') + 1, addr_full.length);
let postcode = addr_full.substring(0, addr_full.indexOf(',') - 1);

$("#payBtn").click(function () {
    console.log(price);
    console.log(addr);
    console.log(postcode);
    console.log("counnter : " + p_count);
    iamport(p_name, price, email, user, tel, addr, postcode);
})
function iamport(p_name, price, email, user, tel, addr, postcode) {
    let uid = "";
    IMP.init('imp22750372');
    IMP.request_pay({
        pg: 'nice.iamport00m',
        pay_method: 'card',
        merchant_uid: 'pp' + createOrderNum(),
        name: p_name,
        amount: price,
        buyer_email: email,
        buyer_name: user,
        buyer_tel: tel,
        buyer_addr: addr,
        buyer_postcode: postcode

    }, function (rsp) { // callback
        console.log(rsp);
        console.log(rsp.paid_amount);
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            /*
            alert(price);
            console.log("step1");
            uid = rsp.imp_uid;
            console.log(uid);     
            */
            console.log("imp_uid" + rsp.imp_uid);
            console.log("orderNum" + rsp.merchant_uid);
            console.log("P_Num : " + p_num);
            console.log("P_Name : " + rsp.name);
            console.log("counter" + p_count);
            console.log("totalPrice" + price);
            console.log("memberNum" + memberNum);
            $.ajax({
                url: '/pay/done',
                type: "POST",
                data: {
                    "imp_uid": rsp.imp_uid,
                    "orderNum": rsp.merchant_uid,
                    "P_Num": p_num, //상품번호
                    "P_Name": rsp.name,
                    "P_Count": p_count,
                    "totalPrice": price,
                    "member_num": memberNum // 회원번호 
                },
                success : function(){
                  location.replace('/pay/buygiftinfo?orderNum='+rsp.merchant_uid);
                }
            })
        } else {
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


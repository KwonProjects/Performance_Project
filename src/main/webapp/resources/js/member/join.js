const mailCheckBtn = document.getElementById("mailCheckBtn");
const addrSearch = document.getElementById("addrSearch");

// ID check
$("#id").on("keyup", function(){
    const rst = isId(id.value)

    if (rst == true) {
        $.ajax({
          type:'get',
          url:'./idCheck',
          data:{
            id: $("#id").val()
          },
          success:function(result){
            if (result.trim() == "1" ) {          
              $("#idResult").html("가능한 ID입니다.");
              $("#idResult").addClass("s");     
            } else {
              $("#idResult").html("이미 사용중인 ID입니다.");
              $("#idResult").addClass("f");     
            }
          },
          error:function(){
            console.log('error');
          }
        })

    } else {
          $("#idResult").html("ID는 6~12자 영문자 또는 숫자이어야 합니다.");
          $("#idResult").addClass("f");     
    }
});

// ID 정규식 체크 메서드
function isId(asValue) {
 
	var regExp = /^[A-Za-z0-9]{6,12}$/;
 
	return regExp.test(asValue); //맞는 경우 true리턴
}

//pw check
$("#pw").on("keyup", function(){
  const rst = isPw(pw.value)

  if (rst == true) {    
    $("#pwResult").html("올바른 비밀번호입니다.");
    $("#pwResult").addClass("s");
  } else {
    $("#pwResult").html("비밀번호는 8~12자 영문자 또는 숫자이어야 합니다.");
    $("#pwResult").addClass("f");
  }
});

$("#pw").on("change", function(){
    $("#pw2").val();
    $("#pw2Result").html("");
});

//pw2 check
$("#pw2").on("keyup", function(){
  if ($("#pw").val() == $("#pw2").val()) {
      $("#pw2Result").html("비밀번호가 맞습니다.");
      $("#pw2Result").addClass("s");
  } else {
      $("#pw2Result").html("비밀번호가 틀렸습니다.");
      $("#pw2Result").addClass("f");
  }
});


// PW 정규식 체크 메서드
function isPw(asValue) {
 
	var regExp = /^[A-Za-z0-9]{8,12}$/;
 
	return regExp.test(asValue); //맞는 경우 true리턴
}

//name check
$("#name").on("keyup", function(){
    let check = emptyCheck($("#name").val());
    console.log(check);
    $("#nameResult").html("이름을 입력해주세요.");
    $("#nameResult").addClass("f");
    if (!check) {
        $("#nameResult").html("");
    }
});

//email check
$("#email").on("keyup", function(){  
    let check = emptyCheck($("#email").val());
    $("#emailResult").html("이메일을 올바른 형식으로 입력해주세요.");
    $("#emailResult").addClass("f");

   const rst = isEmail(email.value)

  if (rst == true) {   
    if (!check) {
      $("#emailResult").html("");
    }
  }
});

//메일인증버튼 눌렀을때
$('#mailCheckBtn').click(function(){
  const email = $('#email').val(); //이메일값
  console.log(email);
  const checkInput = $('.mail-check-input'); //인증번호입력값

  $.ajax({
    type: 'get',
    url: "/member/mailCheck?email="+ email,
    async: true,
    success: function (data) {
      console.log("data: " + data);
      checkInput.attr('disabled', false);
      code = data;
      alert("인증번호가 전송되었습니다.");
    }
  });
});

//인증번호 6자리입력 확인
$('.mail-check-input').blur(function () {
  const inputCode = $(this).val();
  const $resultMsg = $('#mail-check-warn');
  // let check = emptyCheck()
  
  if(inputCode == code){
    $resultMsg.html('인증번호가 일치합니다.');
    $resultMsg.css('color','green');
    $('#mailCheckBtn').attr('disabled',true);   
    $('#email').attr('readonly',true);
  }else{
    $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
    $resultMsg.css('color','red');   }
  
});

function isEmail(asValue) {
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
 
	return regExp.test(asValue);
}

//이름
$("#name").on("keyup", function(){
  let check = emptyCheck($("#name").val());
  console.log(check);
  $("#nameResult").html("이름을 입력해주세요.");
  $("#nameResult").addClass("f");
    if (!check) {
        $("#nameResult").html("");
    }

});

function isCorrect(asValue) {
	var regExp = /[ㄱ-힣]/;    
	return regExp.test(asValue);
}

//핸드폰번호
$("#phone").on("keyup", function(){
  let check = emptyCheck($("#phone").val());
  console.log(check);
  $("#phoneResult").html("핸드폰번호를 입력해주세요.");
  $("#phoneResult").addClass("f");
  if (!check) {
      $("#phoneResult").html("");
  }
});

//생일
$("#birth").on("change", function(){
  let check = emptyCheck($("#birth").val());
  console.log(check);
  $("#birthResult").html("생일을 입력해주세요.");
  $("#birthResult").addClass("f");
  if(!check){
    $("#birthResult").html("");
  }
});


//비어있는지 체크하는 함수
function emptyCheck(val) {
    if (val == null || val.length == 0) {
        return true;
    } else {
        return false;
    }
}



//주소찾기버튼 클릭했을때
addrSearch.addEventListener("click", function () {
  console.log("ok");
  new daum.Postcode({
    oncomplete: function (data) {
      var addr = "";
      var extraAddr = "";

      if (data.userSelectedType === "R") {
        addr = data.roadAddress;
      } else {
        addr = data.jibunAddress;
      }
      if (data.userSelectedType === "R") {
        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname))
          extraAddr += data.bname;

        if (data.buildingName !== "" && data.apartment === "Y")
          extraAddr +=
            extraAddr !== "" ? ", " + data.buildingName : data.buildingName;

        if (extraAddr !== "") extraAddr = " (" + extraAddr + ")";

        document.getElementById("address").value = extraAddr;
      } else {
        document.getElementById("address").value = "";
      }
      document.getElementById("postcode").value = data.zonecode;
      document.getElementById("address").value = addr;
	  document.getElementById("detailAddress").value = "";
      document.getElementById("detailAddress").focus();
    },
  }).open();
});

//회원가입 버튼
$("#joinBtn").on("click", function(){
  //아이디
  if ($("#id").val() == "") {
    alert("[안내] 아이디를 입력해주세요.");
    $("#id").focus();
    return false;
  }
  //비밀번호
  if ($("#pw").val() == "") {
    alert("[안내] 비밀번호를 입력해주세요.");
    $("#pw").focus();
    return false;
  }
  //비밀번호 확인
  if ($("#pw2").val() == "") {
    alert("[안내] 비밀번호 확인을 입력해주세요.");
    $("#pw2").focus();
    return false;
  }
  // 이름
  if ($("#name").val() == "") {
    alert("[안내] 이름을 입력해주세요.");
    $("#name").focus();
    return false;
  }
  // 이메일
  if ($("#email").val() == "") {
    alert("[안내] 이메일을 입력해주세요.");
    $("#email").focus();
    return false;
  }
  
 // 이메일 본인인증
  if ($("#mailcheck").val() == "") {
    alert("[안내] 본인인증번호를 입력해주세요.");
    $("#email").focus();
    return false;
  }
  
  //휴대폰
  if ($("#phone").val() == "") {
    alert("[안내] 휴대폰 번호를 입력해주세요.");
    $("#phone").focus();
    return false;
  }
  //생년월일
  if ($("#birth").val() == "") {
    alert("[안내] 생년월일을 입력해주세요.");
    $("#birth").focus();
    return false;
  }
  // 우편번호
  if ($("#postcode").val() == "") {
    alert("[안내] 우편번호를 입력해주세요.");
    $("#postcode").focus();
    return false;
  }
  // 주소
  if ($("#address").val() == "") {
    alert("[안내] 주소를 입력해주세요.");
    $("#address").focus();
    return false;
  }

  $("#frm").submit();

  return false;
});



// turbolinks off
$(document).on('turbolinks:load', function () {
  //フォームに入力されている文字数を数える
  //\nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
  var count = $(".js-comment").text().replace(/\n/g, "改行").length;
  //文字数がオーバーしていたら文字色を赤にする
  // if (count > 200) //→編集画面などで、すでに入力がある場合に必要
  //   $(".js-comment-count").css("color","red");
  // }
  $(".js-comment-count").text( count + "/200文字");

  $(".js-comment").on("keyup", function() {
    // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
    //フォームのvalueの文字数を数える
    var count = $(this).val().replace(/\n/g, "改行").length;
    // var now_count = 200 - count;
    if (count > 200) {
      $(".js-comment-count").css("color","red");
    } else {
      $(".js-comment-count").css("color","black");
    }
    $(this).parents().children(".js-comment-count").text(count + "/200文字");
  });
  
    var review_count = $(".js-edit-comment").text().replace(/\n/g, "改行").length;
  //文字数がオーバーしていたら文字色を赤にする
  // if (count > 200) //→編集画面などで、すでに入力がある場合に必要
  //   $(".js-comment-count").css("color","red");
  // }
  $(".js-edit-comment-count").text( review_count + "/200文字");

  $(".js-edit-comment").on("keyup", function() {
    // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
    //フォームのvalueの文字数を数える
    var review_count = $(this).val().replace(/\n/g, "改行").length;
    // var now_count = 200 - count;
    if (review_count > 200) {
      $(".js-edit-comment-count").css("color","red");
    } else {
      $(".js-edit-comment-count").css("color","black");
    }
    $(".js-edit-comment-count").text(review_count + "/200文字");
  });
});
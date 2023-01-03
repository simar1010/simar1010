// $(document).ready(function () {
//     showTimer();

//     $(document).ajaxComplete(function () {
//       showTimer();
//     });
// });


  //copy link script
function copyToClipboard(text, el) {
  var copyTest = document.queryCommandSupported('copy');
  var elOriginalText = el.attr('data-original-title');

  if (copyTest === true) {
    var copyTextArea = document.createElement("textarea");
    copyTextArea.value = text;
    document.body.appendChild(copyTextArea);
    copyTextArea.select();
    try {
      var successful = document.execCommand('copy');
      var msg = successful ? 'Copied!' : 'Whoops, not copied!';
      // alert(msg);
      el.attr('data-bs-original-title', msg).tooltip('show');

    } catch (err) {
      console.log('Oops, unable to copy');
    }
    document.body.removeChild(copyTextArea);
    el.attr('data-original-title', elOriginalText);
  } else {
    // Fallback if browser doesn't support .execCommand('copy')
    window.prompt("Copy to clipboard: Ctrl+C or Command+C, Enter", text);
  }
}

$(document).ready(function() {
  $('.js-tooltip').tooltip();

  $('.js-copy').click(function() {
    // alert('gfgf');
    var text = $(this).attr('data-copy');
    var el = $(this);

    copyToClipboard(text, el);
  });
});

  //for like dislike js *sanjay*
  function likedata(post_id,type){
    alert('jghfjf');
    // var user_id = {{ Auth::user()->id }};
    // var type = type;
    //    //$(".loader" ).show();

    // $.ajaxSetup({
    // headers: {
    //     'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    //   }
    // });

    // $.ajax({
    //    type:'POST',
    //    url: "{{ url('postLikeDiske') }}",
    //     data: { post_id:post_id, user_id:user_id, type:type},
    //     success: (response) => {
    //           //$(".loader" ).hide();
    //       if(response.success){

    //         if(type == 1){
    //           var datashow = "<img src='img/heart_active.svg' onclick='likedata("+post_id+",2)' class='active_heart_svg'>";
    //         }else{
    //           var datashow = "<img src='img/heart.svg'  onclick='likedata("+post_id+",1)'  class='heart_svg'>";
    //         }
    //           $(".heart_"+post_id).html(datashow);
    //          }
    //      },
    //     error: function(response){
    //        alert('Error In Like Functionality Please check!');
    //     }
    // });
  }

  function saveforlatter(post_id,type){
    var user_id = {{ Auth::user()->id }};
    var type = type;

        //$(".loader" ).show();
    $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });

    $.ajax({
       type:'POST',
       url: "{{ url('postsavelater') }}",
        data: { post_id:post_id, user_id:user_id, type:type},
        success: (response) => {
          if(response.success){
                //$(".loader" ).hide();
            if(type == 1){
                var datashow = "<img src='img/star_actives.svg' class='star_active_svg' onclick='saveforlatter("+post_id+",2)'>";
              }else{
                var datashow =  "<img src='img/fa_regular_star.svg' onclick='saveforlatter("+post_id+",1)' class='star_svg'>";
              }
                 $(".star_"+post_id).html(datashow);

             }
           },
        error: function(response){
           alert('Error In Post Save Later Functionality Please check!');
        }
    });

  }


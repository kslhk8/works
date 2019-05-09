	$(document).ready(function() {
          $(".jq_snb_navigation").mouseenter(function(){
            $(this).addClass("on");
            $(this).find(".jq_snb_list").addClass("on");
          });

          //서브 네비
          $(".jq_snb_navigation").mouseleave(function(){
            $(this).removeClass("on");
            $(this).find(".jq_snb_list").removeClass("on");
         });        
    });

//alert();

var globalVar = {
    imageNum : 0,
    getShowInterval:""
}

$(document).ready(function(){
    hoverEffect(".NextSlide");
    hoverEffect(".PrevSlide");
    change();
    Timer();
    showNextImage();
    showPrevImage();
    slideMenu();
});


function hoverEffect(hoverClass){
    $(hoverClass).hover(
        function(){
            $(hoverClass).animate({opacity:'1'},"slow");    
        }, 
        function(){
            $(hoverClass).animate({opacity:'0.5'},"slow");
        });
}

/*
change image
*/

function change(){ 
        
        globalVar.getShowInterval=setInterval(function(){
        if(globalVar.imageNum==2){
            
            show(0);
            globalVar.imageNum=0;
            clearTimer(1);
            Timer();
        }
        else{
            
            globalVar.imageNum++;
            show(globalVar.imageNum); 
            Timer();
        } },5000);    
}

function show(i){
    
    hidenText();
    $('.slide:eq('+i+')').css({opacity:0,zIndex:2}).show().animate({opacity:1},{
        duration:750,
        easing:"swing",
        complete: function(){
            $(".slide:lt("+i+"), .slide:gt("+i+")").css({
                zIndex:0}).hide();
        
            $(".slide:eq("+i+")").css({
                zIndex:1
            });
        }
    });
    
    showText();
}

/*
    hidden title and description;
*/
function hidenText(){
    $('.title').animate({opacity:0},
                        {
                         duration:300,
                         easing:"swing",
                        });
    setTimeout(hidenDescription,150);
}

function hidenDescription(){
    $('.description').animate({opacity:0},
                              {
                               duration:300,
                               easing:"swing"
                              });    
}

/*
  show title and description;
*/
function showText(){
      $('.title').animate({opacity:1},
                        {
                         duration:300,
                         easing:"swing",
                        });
      setTimeout(showDescription,300);
}

function showDescription(){
    $('.description').animate({opacity:1},
                             { 
                               duration:300,
                               easing:"swing"
                             });
}


/*
function nextImage
*/

function showNextImage(){
   $(".NextSlide").click(    
    function(){
        clearInterval(globalVar.getShowInterval);
        if(globalVar.imageNum==2){
			$('.slide:eq('+2+')').finish();
            show(0);
            NextTimer();
            clearTimer(1);
            globalVar.imageNum=0;
            Timer();
        }
        else{
            NextTimer();
			$('.slide:eq('+globalVar.imageNum+')').finish();
            globalVar.imageNum++;
            show(globalVar.imageNum);    
            Timer();
        }
        change();
    });
}

/*show previous Image*/
function showPrevImage(){
   $(".PrevSlide").click(    
    function(){
          clearInterval(globalVar.getShowInterval);
        if(globalVar.imageNum==0){
			$('.slide:eq('+0+')').finish();
            PrevTimer(2);
            show(2);
            globalVar.imageNum=2;
            Timer();
        }
        else{
            PrevTimer(1);
			$('.slide:eq('+globalVar.imageNum+')').finish();
            globalVar.imageNum--;
            show(globalVar.imageNum);
            Timer();
        }
        change();
    });
}

/******** Timer *********/
function Timer(){
   // $(".timers .timer .process:gt("+globalVar.imageNum+")").css("width",0);
    $(".timers .timer .process:eq("+globalVar.imageNum+")").animate(
        {width:"100%"},{duration:4900,easing:"linear"});    
}

function NextTimer(){
    $(".timers .timer .process:eq("+globalVar.imageNum+")").stop(true, true);
}

function PrevTimer (model){
    if(model==1){
    var pre = globalVar.imageNum-1;
        $(".timers .timer .process:eq("+globalVar.imageNum+")").stop(true, true);
        $(".timers .timer .process:eq("+globalVar.imageNum+")").css("width",0);
        $(".timers .timer .process:eq("+pre+")").css("width",0);
        
    }
    
    if(model==2){
        $(".timers .timer .process:eq("+globalVar.imageNum+")").stop(true, true);
        $(".timers .timer .process:eq("+globalVar.imageNum+")").css("width",0);
        $(".timers .timer .process:eq("+2+")").css("width",0);
        $(".timers .timer .process:lt("+2+")").css("width","100%");
    }
}
/*
model=1 clear all Timers

*/

function clearTimer(model){
    if(model==1){    
        $(".timers .timer .process").css("width",0);
    }
   
}






function slideMenu(){
    
    var height = $("#form1 .formHospital").height();
    $("#form1 .search").click(function () {
            
            $("#form1 .formHospital").slideToggle(2000); 
            $('html, body').animate({ scrollTop: '+=' + height }, 2000);
            

          
    });

    $("#form1 .add").click(function () {

        $("#form1 .formHospital1").slideToggle(2000);
        $('html, body').animate({ scrollTop: '+=' + height }, 2000);



    });


    $("#form1 .modify").click(function () {

        $("#form1 .formHospital3").slideToggle(2000);
        $('html, body').animate({ scrollTop: '+=' + height }, 2000);



    });

    $("#form1 .delete").click(function () {

        $("#form1 .formHospital2").slideToggle(2000);
        $('html, body').animate({ scrollTop: '+=' + height }, 2000);



    });
    
}



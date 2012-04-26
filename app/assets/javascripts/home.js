$('input#fb_connect').click(function(e) {
var width = 600, height = 400;
var left = (screen.width / 2) - (width / 2);
var top = (screen.height / 2) - (2 * height / 3);
var features = 'menubar=no,toolbar=no,status=no,width=' + width + ',height=' + height + ',toolbar=no,left=' + left + ',top=' + top;
var loginWindow = window.open('/users/auth/facebook', '_blank', features);
loginWindow.focus();
e.preventDefault();
return false;
});

 
// 
// window.fbAsyncInit = function() {
//      FB.init({
//        appId  : '372191216164729',
//        status : true, // check login status
//        cookie : true, // enable cookies to allow the server to access the session
//        xfbml  : true  // parse XFBML
//      });
//    };
// 
//    (function(d) {
//      var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
//      js = d.createElement('script'); js.id = id; js.async = true;
//      js.src = "//connect.facebook.net/en_US/all.js";
//      d.getElementsByTagName('head')[0].appendChild(js);
//    }(document));
// 
//    $(function() {
//      $('#fb_connect').click(function(e) {
//        e.preventDefault();
// 
//        FB.login(function(response) {
//          if (response.authResponse) {
//            // $('#connect').html('Connected! Hitting OmniAuth callback (GET /auth/facebook/callback)...');
// 
// 					//this might not be the best way to do this ...
// 					$('#welcome_form').submit();
//            // since we have cookies enabled, this request will allow omniauth to parse
//            // out the auth code from the signed request in the fbsr_XXX cookie
//            // $.getJSON('/auth/facebook/callback', function(json) {
//            //             $('#connect').html('Connected! Callback complete.');
//            //             $('#results').html(JSON.stringify(json));
//            //           });
//          }
//        }, { scope: 'email, read_stream' });
//      });
//    });
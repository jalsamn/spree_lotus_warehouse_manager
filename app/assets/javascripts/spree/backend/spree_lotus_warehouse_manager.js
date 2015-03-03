// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'


$(".task-check").bind('change', function(){
  if (this.checked){
    alert("yes checked");
  }
  else {
     alert("no");
  }
});
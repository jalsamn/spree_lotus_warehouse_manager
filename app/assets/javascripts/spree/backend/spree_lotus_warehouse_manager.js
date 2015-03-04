// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/backend/all.js'

function addProduct1(cb, varid)
{
  if(cb.checked){
    alert("Changed, new value true and Var is " + varid);

  }
  else{
     alert("Changed, new value false");
  }
     
}

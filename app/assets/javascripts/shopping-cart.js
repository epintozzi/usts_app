function calculateCartTotal(){
  var total = 0;
  // figure out all checked boxes
  $('table input[type="checkbox"]:checked').each(function(i, checkbox){
    var children = $(checkbox).parent().parent().children();
    var amount = $.trim(children[children.length - 2].innerHTML);
    //remove dollar sign
    amount = parseFloat(amount.substr(1));
    // add to total
    total = amount + total;
  });
  total = "$" + total
  return total;
}

function updateTotalView(newTotal){
  $('#total-due').text(newTotal);
}

$(document).ready(function(){
  calculateCartTotal();
  //checkboxes
  $('table input[type="checkbox"]').click(function(){
    var newTotal = calculateCartTotal();
    updateTotalView(newTotal);
  });
});

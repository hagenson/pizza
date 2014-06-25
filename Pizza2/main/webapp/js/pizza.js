function addToCart(sizeId){
  var url = 'cart.html?op=add&id=' + sizeId.toString();
  $('#cartContent').load(url, null, buttoniseCart);
}

function dlgCancel(){
  $('#dlg').dialog("close");
}

function placeOrder(){
  var url = 'buy.html';
  $('#dlgContent').load(url, null, dlgLoaded);
}

function dlgLoaded(){
  buttonise();
  $('#dlg').dialog("open");
}

function cancelOrder(){
  var url = 'cart.html?op=cancel';
  $('#cartContent').load(url);  
}

function newCustomer(){
  $('#custLogin').hide();  
  $('#custDetails').show();
}

function existingCustomer(){
  $('#custDetails').hide();
  $('#custLogin').show();  
}


function custCreate(){
  // Post the customer create form back
  var url = 'custCreate.html';
  var data = $('#custDetailsFrm').serialize();
  $.post(
      url,
      data,
      custCreated);
}

function custCreated(data, status, xhr){
  if (status == 'success'){
    $('#dlgContent').html(data);
    buttonise();
  }
    
}

function processOrder(){
  // Post the credit card form back
  var url = 'orderProcess.html';
  var data = $('#cardDetailsFrm').serialize();
  $.post(
      url,
      data,
      orderProcessed);
}

function orderProcessed(data, status, xhr){
  if (status == 'success'){
    $('#dlgContent').html(data);
    buttonise();
  }
}

function buttonise(){
  $('#dlgContent').find('.button').button();
}

function buttoniseCart(){
  $('#cartContent').find('.button').button();
}


function buyComplete(){
  // Re-load the main page to clear the old order
  location.reload();
}

function lineInc(lineId){
  var url = 'cart.html?op=inc&id=' + lineId.toString();
  $('#cartContent').load(url, null, buttoniseCart);
}

function lineDec(lineId){
  var url = 'cart.html?op=dec&id=' + lineId.toString();
  $('#cartContent').load(url, null, buttoniseCart);  
}

function customiseDialog(sizeId){
  var url = "customise.html?id=" + sizeId.toString();
  $('#dlgContent').load(url, null, dlgLoaded);
}

function custOptClick(elem){
  var e = $('#' + elem);
  var price = parseFloat($('#custTotal').val());
  var delta = parseFloat(e.val());
  if (e.is(':checked'))
    price = price + delta;
  else
    price = price - delta;
  
  $('#custTotal').val(price);
  $('#custTotalCost').text(price.toFixed(2));  
}

function customisePost(){
  var url = "customCart.html";
  var data = $('#customiseFrm').serialize();
  $.post(
      url,
      data,
      customiseProcessed);  
}

function customiseProcessed(data, status, xhr){
  if (status == 'success'){
    $('#dlg').dialog('close');
    $('#cartContent').html(data);
  }
}

$(document).ready(function(){
  // Set up the buy dialog
  $('#dlg').dialog({
    autoOpen: false,
    modal: true,
    width: 500,
    show: {
    effect: "blind",
    duration: 1000
    },
    hide: {
    effect: "explode",
    duration: 1000
    }
    });  
  
  // Button-ise the buttons
  $('.button').button();
  
});
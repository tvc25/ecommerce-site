$(document).ready(function(){
  console.log('loaded!')
  $('.addToCart').on('click', function(e){
    e.preventDefault()
    console.log('clicked')
    var productQuantity = $(this).closest('form').find('select').val();
    var productId =  $(this).prev().val();
    $.ajax({
      method: "POST",
      url:"/order_products",
      data: {order_product: {product_id:productId, quantity:productQuantity}},
      dataType: "json"
    })
    .done(function(data){
      console.log(data);
      $('.flash_msg').text(data.status);
    })
  })

//Remove item from cart
$('.removeFromCart').on('click', function(e){
  e.preventDefault()
  console.log('clicked')
  var productId = $(this).closest('tr').data().productid
  $.ajax({
    method: "DELETE",
    url:"/order_products/" + productId,
    dataType: "json"
  })
  .done(function(data){
    $('body').find("[data-productID='" + productId + "']").fadeOut();
    $('.flash_msg').text(data.status).toggleClass('wobble-vertical');
    //redraw the total price on screen so that it will update instantly whenever item removed from cart
    $('.totalPrice').html('<b>$' + data.updatedPrice + '0 AUD</b>');

  })
})


});



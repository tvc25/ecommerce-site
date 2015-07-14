$(document).ready(function(){
  console.log('loaded!')
  $('.cart-button').on('click', function(e){
    e.preventDefault()
    console.log('clicked')
    var productQuantity = $(this).closest('.input-group').find('.form-control').val()
    var productId =  $(this).closest('.well').data('id')

    $.ajax({
      method: "POST",
      url:"/order_products",
      data: {order_product: {product_id:productId, quantity:productQuantity}},
      dataType: "json"
    })
    .done(function(data){
      //You can update the html, the count is inside data.count
    })
  })
});

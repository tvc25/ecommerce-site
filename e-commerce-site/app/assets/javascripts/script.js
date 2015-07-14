$(document).ready(function(){
  console.log('loaded!')
  $('.addToCart').on('click', function(e){
    e.preventDefault()
    console.log('clicked')
    var productQuantity = $(this).closest('.form').find('select').val()
    var productId =  $(this).closest('.product_right_panel').data('id')
    $.ajax({
      method: "POST",
      url:"/order_products",
      data: {order_product: {product_id:productId, quantity:productQuantity}},
      dataType: "json"
    })
    .done(function(data){
      var count = data.status.count
      $(".global-menu #checkout-link span").text("("+ count + ")")
      
    })
  })
});

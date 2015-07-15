json.array!(@orders) do |order|
  json.extract! order, :id, :order_reference, :amount, :user_id, :product_id
  json.url order_url(order, format: :json)
end

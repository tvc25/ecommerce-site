json.array!(@products) do |product|
  json.extract! product, :id, :name, :tag, :price, :category_id, :active, :description, :image
  json.url product_url(product, format: :json)
end

json.array!(@products) do |product|
  json.extract! product, :id, :name
  json.url category_product_url(product.category, product, format: :json)
end

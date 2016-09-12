json.array!(@receipts) do |receipt|
  json.extract! receipt, :id, :fecha, :valor_total
  json.url receipt_url(receipt, format: :json)
end

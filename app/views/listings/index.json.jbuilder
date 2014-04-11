json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :slug, :price
  json.url listing_url(listing, format: :json)
end

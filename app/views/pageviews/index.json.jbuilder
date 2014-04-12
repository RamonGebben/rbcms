json.array!(@pageviews) do |pageview|
  json.extract! pageview, :id, :post_id, :user_ip
  json.url pageview_url(pageview, format: :json)
end

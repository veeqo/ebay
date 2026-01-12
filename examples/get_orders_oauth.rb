#!/usr/bin/ruby
$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__),'..', 'lib')

require 'ebay'

# Configure eBay API with OAuth2 token
Ebay::Api.configure do |ebay|
  ebay.rest_api_oauth_token = 'YOUR_OAUTH2_TOKEN_HERE'
  ebay.use_sandbox = true  # Set to false for production
end

# Create API instance
ebay = Ebay::Api.new

begin
  # Get orders using OAuth2 authentication
  response = ebay.get_orders(
    create_time_from: Time.parse('2025-11-12T21:59:59.005Z'),
    create_time_to: Time.parse('2025-12-28T21:59:59.005Z'),
    order_role: 'Seller',
    order_status: 'Completed',
    pagination: Ebay::Types::Pagination.new(entries_per_page: 2)
  )

  puts "Successfully retrieved orders using OAuth2!"
  puts "Total orders: #{response.pagination_result.total_number_of_entries}"
  puts "Orders returned: #{response.returned_order_count_actual}"

  if response.orders && response.orders.any?
    response.order_array.each_with_index do |order, index|
      puts "Order #{index + 1}: #{order.order_id}"
    end
  else
    puts "No orders found in the specified date range"
  end

rescue Ebay::RequestError => e
  puts "eBay API Error:"
  e.errors.each do |error|
    puts "  #{error.short_message}: #{error.long_message}"
  end
rescue => e
  puts "Error: #{e.message}"
end

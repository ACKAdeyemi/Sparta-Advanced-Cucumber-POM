Before do
  @bbc_site = BBC_Site.new
  puts "Loading Test scenario..."
end

After do
  puts "Test scenario successully complete."
  sleep 3
end

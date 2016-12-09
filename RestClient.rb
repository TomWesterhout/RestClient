require 'RestClient'

puts "Welcome to RestClient, a Ruby gem which allows you to make HTTP requests."
puts "You're about to enter a search request into the Bing search engine through RestClient."
loop do
	puts "Please enter one or multiple search terms.."
	puts
	search = gets.chomp.gsub(' ', '+')
	results = RestClient.get 'https://www.bing.com/search', {params: {q: search}}
	puts "-----------------------------------------------------"
	puts "The following is an examination of the search results:"
	puts "-----------------------------------------------------"
	puts "HTTP response code:\n #{results.code}"
	puts "-----------------------------------------------------"
	puts "A hash of HTTP cookies set by the server:\n #{results.cookies}"
	puts "-----------------------------------------------------"
	puts "A hash of HTTP response header:\n #{results.headers}"
	puts "-----------------------------------------------------"
	puts "The object used to make the request:\n #{results.request}"
	puts "-----------------------------------------------------"
	puts "Do you want to continue (y/n)?"
	response = gets.chomp
	while response !~ /[yn]/
		puts "Please enter (y/n):"
		response = gets.chomp
	end
	break if response == "n"
end
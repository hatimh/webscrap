require 'nokogiri'
require 'open-uri'
require 'colorize'
require_relative 'post'

url = ARGV[0]
# url only works for Hacker News post e.g https://news.ycombinator.com/item?id=7663775

begin
page = Nokogiri::HTML(open(url))


item_id = url.match(/\d+/).to_s
title = page.css("title").inner_text
points = page.css(".score").inner_text

a_post = Post.new(title,url,item_id,points)

comments = []
page.css(".comment").each {|element| comments << element.inner_text.gsub("\n","")}
users = []
page.search("span.comhead > a:first-child").each{|element| users<<element.inner_text}

for i in 0..comments.size-1
  a_post.add_comment(Comment.new(users[i+1],comments[i]))
end  

a_post.comments

rescue
  p InvalidUrlError
  p "Url not valid or unsupported"
  
end  
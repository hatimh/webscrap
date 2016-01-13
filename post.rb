class InvalidUrlError < StandardError

end

class Post
  attr_accessor :comment_list #, :item_id,:title, :url, :points, :
  
  def initialize(title,url,item_id, points)
    @url  = url
    @title = title
    @points = points
    @comment_list = []
    @item_id = item_id
  end

  def comments
     puts "id: " + @item_id + "\n" + "title: " + @title +"\n" + "points: " + @points 
     comment_list.each {|comment| puts "\n" + comment.user.blue + "\n" + comment.content.green} 
  end  

  def add_comment(comment)
    @comment_list << comment
  end
end

class Comment
  attr_accessor :user, :content
  def initialize(user, content)
    @user = user
    @content = content
  end  
end
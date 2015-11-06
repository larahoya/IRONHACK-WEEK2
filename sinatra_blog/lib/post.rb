require 'pry'

class Post

  attr_reader :title, :text, :date, :sponsored, :cathegory, :author
  
  def initialize(title, text, sponsored=false, cathegory, author)
    @title = title
    @text = text
    @date = Time.now
    @sponsored = sponsored
    @cathegory = cathegory
    @author = author
  end

end
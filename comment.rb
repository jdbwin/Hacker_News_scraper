class Comment

  attr_accessor :poster, :text, :links

  def initialize(poster, date_posted, text, links='')

    @poster = poster
    @date_posted = date_posted
    @text = text
    @links = links

  end

  def to_s
    puts "#{@poster}".light_blue
    puts "#{@date_posted}".blue
    puts "#{@text}"
    puts "#{@links}".red
  end

  class << self

  @@post = '.comment-tree .athing .comhead'

    def create(post, index)
      Comment.new(get_username(post, index), get_date_posted(post, index), get_text(post, index))
    end

    def get_username(post, index)
      username = post.css("#{@@post} > a:first-child")[index]
      username.inner_text if username
    end

    def get_date_posted(post, index)
      date = post.css("#{@@post} > .age")[index]
      date.inner_text if date
    end

    def get_text(post, index)
      comment = post.css(".comment")[index]
      comment.inner_text if comment
    end

  end
end

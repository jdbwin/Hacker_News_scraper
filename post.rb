class Post

  @@comment_list = []

  attr_accessor :title, :url, :points, :item_id

  def initialize(title, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
  end

  def to_s
    puts "#{@title}".light_green
    puts "#{@item_id}"
    puts "#{@points}".green
  end

  def comments
    @@comment_list
  end

  def add_comment(target, index)
    @@comment_list << Comment::create(target, index)
  end

  class << self

    def create(target)
      Post.new(get_title(target), get_points(target), get_item_id(target))
    end

    def get_title(post)
      post.css('title').inner_text
    end

    def get_points(post)
      post.css('.score').inner_text
    end

    def get_item_id(post)
      post.css('.pagetop > a:first-child').map.first.to_s.scan(/\d{2,}/)[0]
    end

  end

end

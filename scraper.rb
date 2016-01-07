require_relative 'post'
require_relative 'comment'
require 'nokogiri'
require 'colorize'
require 'open-uri'

class UI

  class << self

    def new(url)
      new_post = Post::create(url)
      amount_of_comments = url.css('.comment-tree .athing').length
      index = 0

      new_post.to_s

      index.upto(amount_of_comments) do
        new_post.add_comment(url, index)
        index += 1
      end

      new_post.comments.each {|comment| comment.to_s}

    end
  end

end

url = Nokogiri::HTML(open(ARGV[0]))

UI::new(url)

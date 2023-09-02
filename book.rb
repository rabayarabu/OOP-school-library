class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rental(rental)
    @rentals.push(rental)
  end

  def to_s
    "Title: #{@title}, Author: #{@author}"
  end
end

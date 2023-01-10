class Book
  BOOKS = ['Book 0', 'Book 1', 'Book 2']

  attr_accessor :attributes

  def initialize(attributes = {})
    @attributes = attributes
  end

  def self.find(id)
    Book.new id: id.to_i
  end
end

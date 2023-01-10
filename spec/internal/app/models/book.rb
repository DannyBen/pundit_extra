class Book
  BOOKS = ['Book 0', 'Book 1', 'Book 2']

  attr_accessor :attributes

  class << self
    def find(id)
      new id: id.to_i
    end
  end

  def initialize(attributes = {})
    @attributes = attributes
  end
end

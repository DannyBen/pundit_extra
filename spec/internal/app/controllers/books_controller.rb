class BooksController < ApplicationController
  load_resource
  authorize_resource

  def create
    render plain: "will create book: #{@book.attributes}"
  end

  def update
    render plain: "will update book: #{permitted_attributes(@book)}"
  end
end

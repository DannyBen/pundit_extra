class BooksController < ApplicationController
  load_resource
  authorize_resource

  def create
    render plain: "will create book with params: #{permitted_attributes(@book)}"
  end

  def update
    render plain: "will update book with params: #{permitted_attributes(@book)}"
  end
end

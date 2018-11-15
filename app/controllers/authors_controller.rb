class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
    #code
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    redirect_to @author
  end

  def edit
    #code
  end

  def update
    @author.update(author_params)
    redirect_to @author
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def find_author
    @author = Author.find_by(id: params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :phone_number)
  end
end

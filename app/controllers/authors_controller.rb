class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new

end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      # If--and only if--the post is valid, do what we usually do.
      @author.save
      # This returns a status_code of 302, which instructs the browser to
      # perform a NEW REQUEST! (AKA: throw @post away and let the show action
      # worry about re-reading it from the database)
      redirect_to author_path(@author)
    else
      render :new
  end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end

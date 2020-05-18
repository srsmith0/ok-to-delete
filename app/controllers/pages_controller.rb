class PagesController < ApplicationController
  def index
    @pages = Page.all #controller is interacting with model here

    #although we don't do anything, rails automatically does this for us
    
  end

  def show
  #find a page but we need an ID
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    # all these methods go to a folder views/pages/new.html/txt/etc..
  end

  def edit
    #want to give the form to edit with all information on it
    #pass the ID to identify it.. use params
    @page = Page.find(params[:id]) #id is passed through URL
  end

  def update
    @page = Page.find(params[:id])

    if (@page.update(pages_params))
      redirect_to pages_path
    else
      render :edit
    end
  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  private

    def pages_params
      params.require(:page).permit(:title, :author, :body)
    end
    #this makes it so that only these things are passed to the data base
end

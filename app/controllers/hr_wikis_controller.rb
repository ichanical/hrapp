class HrWikisController < ApplicationController
  def index
    @hr_wikis=HrWiki.all
  end
  
  def show
    @hr_wiki=HrWiki.find params[:id]
  end
  
  def new
    @hr_wiki = HrWiki.new
    @hr_wikis = HrWiki.all
  end
  
  def create
    @hr_wiki=HrWiki.new(params[:hr_wiki])
    @hr_wikis = HrWiki.all
    if @hr_wiki.save
      redirect_to new_hr_wiki_path,:notice=>"Data saving successful"
    else
      render :new
    end
  end
  
  def edit
    @hr_wiki=HrWiki.find params[:id]
  end
  
  def update
    @hr_wiki=HrWiki.find params[:id]
    @hr_wiki.update_attributes(params[:hr_wiki])
    if @hr_wiki.save
      redirect_to new_hr_wiki_path,:notice=>"Data saving successful"
    else 
      render :edit
    end
  end
  
  def destroy
     @hr_wiki=HrWiki.find params[:id]
     if @hr_wiki.destroy
       redirect_to new_hr_wiki_path
     else 
        redirect_to new_hr_wiki_path,:notice=>"Data could not deleted"
     end
  end
end

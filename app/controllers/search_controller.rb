class SearchController < ApplicationController

  def index
    q="%#{params[:keyword]}%"
    @results=HrWiki.all(:conditions=>["lower(term) like ?",q.downcase])
    respond_to do |format|
      format.html  {render :text => "text to render..."}
      format.json  { render :json => @results }
    end
  end
  
end

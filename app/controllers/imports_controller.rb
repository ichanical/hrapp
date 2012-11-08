class ImportsController < ApplicationController
require 'spreadsheet'
  def new
    @import = Import.new
  end
  
  def create
    @import = Import.new(params[:import])
    if @import.save
      Spreadsheet.client_encoding = 'UTF-8'
      book = Spreadsheet.open @import.attachment.path(:original)
      sheet0 = book.worksheet 0
      sheet0.each 1 do |row|
        hr_wiki = HrWiki.new()
        hr_wiki.term = row[0]
        hr_wiki.definition = row[1]
        hr_wiki.save
      end
      redirect_to root_url, :notice=>" Import has been succesfull." and return 
    else
      redirect_to root_url, :notice=>" Import has been unsuccesfull." and return 
    end
  end
 
end

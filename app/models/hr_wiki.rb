class HrWiki < ActiveRecord::Base
  attr_accessible :term, :definition
  validates :term, :definition,:presence=>true
 
end

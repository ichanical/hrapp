class Import < ActiveRecord::Base
  attr_accessible :attachment
  has_attached_file :attachment,
    :path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension"

end

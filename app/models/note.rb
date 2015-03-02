class Note < ActiveRecord::Base

  belongs_to :user

  validates :title , :presence => true

  serialize :share_with
  
end

class Page < ActiveRecord::Base
  acts_as_taggable
  has_paper_trail
  belongs_to :user
end
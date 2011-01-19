class Photo < ActiveRecord::Base
  validates_presence_of :title, :description, :date, :url
  validates_uniqueness_of :title
  belongs_to :event
end

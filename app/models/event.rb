class Event < ActiveRecord::Base
  DEFAULT_MEETING_LENGTH = 2.hours
  validates_presence_of :title, :body, :start_time, :end_time
  validates_uniqueness_of :title, :case_sensitive => false
end
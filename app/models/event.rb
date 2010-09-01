class Event < ActiveRecord::Base
  DEFAULT_MEETING_LENGTH = 2.hours
  validates_presence_of :title, :body, :start_time, :end_time
  validates_uniqueness_of :title, :case_sensitive => false
  
  validate :end_time_should_be_after_start_time

  scope :past, where("events.start_time IS NOT NULL AND events.start_time <= now()").order("start_time DESC")
  scope :upcoming, where("events.start_time IS NOT NULL AND events.start_time > now()")
  
  private
  
    def end_time_should_be_after_start_time
      errors.add(:end_time, "Must be after start time") if start_time && end_time && start_time > end_time
    end
  
end
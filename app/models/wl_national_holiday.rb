class WlNationalHoliday < ActiveRecord::Base
  unloadable
  attr_accessible :date_from
  attr_accessible :date_to
  attr_accessible :reason
  validates :date_from, :date => true
  validates :date_to, :date => true
  validates_presence_of :date_from, :date_to, :reason
  validate :check_datum
  
  after_save :clearCache
  after_destroy :clearCache
  
  def check_datum
    if self.date_from && self.date_to && (start_changed? || end_changed?) && self.date_to < self.date_from 
       errors.add :date_to, :workload_end_before_start 
    end 
  end
  
  private
  def clearCache
    Rails.cache.clear
  end
end

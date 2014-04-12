class Pageview < ActiveRecord::Base

  def self.total_from_to( s, e )
    where("(created_at > ?) AND (created_at < ?) ", s, e).count   
  end

  def self.weeks
   
    result = []
    52.times do |t|
      result << Pageview.total_from_to( (t+1).weeks.ago, t.weeks.ago )
    end

    return result
  end

  def self.days
   
    result = []
    14.times do |t|
      result << Pageview.total_from_to( (t+1).days.ago, t.days.ago )
    end

    return result
  end

  def self.hours
   
    result = []
    48.times do |t|
      result << Pageview.total_from_to( (t+1).hours.ago, t.hours.ago )
    end

    return result
  end

  def self.years
   
    result = []
    10.times do |t|
      result << Pageview.total_from_to( (t+1).years.ago, t.years.ago )
    end

    return result
  end

  

end

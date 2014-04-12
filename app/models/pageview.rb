class Pageview < ActiveRecord::Base

  def self.total_from_to( s, e )
    where("(created_at > ?) AND (created_at < ?) ", s, e).count   
  end

  def self.weeks
   
    result = [["Weeks","Views"]]
    26.times do |t|
      result << [ t.weeks.ago.strftime('%e %b'), Pageview.total_from_to( (t+1).weeks.ago, t.weeks.ago ) ]
    end

    return result
  end

  def self.days
   
    result = [["Days","Views"]]
    14.times do |t|
      result << [ t.days.ago.strftime('%e %b'), Pageview.total_from_to( (t+1).days.ago, t.days.ago ) ]
    end

    return result
  end

  def self.hours
   
    result = [["Hours","Views"]]
    48.times do |t|
      result << [ "#{t.hours.ago.hour}:00", Pageview.total_from_to( (t+1).hours.ago, t.hours.ago ) ]
    end

    return result
  end

  def self.quarters
   
    result = [["Querters", "Views"]]
    12.times do |t|
      result << [ (t*3).months.ago.strftime("%b %Y"), Pageview.total_from_to( ((t+1)*3).months.ago, (t*3).months.ago ) ]
    end

    return result
  end

  def self.years
   
    result = [["Year", "Views"]]
    3.times do |t|
      result << [ t.years.ago.year.to_s, Pageview.total_from_to( (t+1).years.ago, t.years.ago ) ]
    end

    return result
  end

  

end

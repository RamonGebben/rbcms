class Pageview < ActiveRecord::Base

  def self.top5_posts
    s = 6.months.ago
    e = 1.minutes.ago
    where("(post_id IS NOT NULL) AND (created_at > ?) AND (created_at < ?) ", s, e).select("*, count(1) as viewcount").group("post_id").order("viewcount desc").limit(5).collect do |p|
      Post.find( p.post_id )
    end
  end

  def self.top5( s, e )
    where("(created_at > ?) AND (created_at < ?) ", s, e).select("*, count(1) as viewcount").group("post_id").order("viewcount desc").limit(5)
  end

  def self.total_from_to( s, e )
    where("(created_at > ?) AND (created_at < ?) ", s, e).count   
  end

  def self.total_from_to_post( s, e, p )
    if p then 
      where("(post_id = ?) AND (created_at > ?) AND (created_at < ?) ", p, s, e).count   
    else
      where("(post_id IS NULL) AND (created_at > ?) AND (created_at < ?) ", s, e).count   
    end
  end

  def self.weeks
   
    labels = ["Date", "Total"]
    t5 = self.top5( 26.weeks.ago, 0.weeks.ago )
    t5.each do |t|
      if t.post_id then
        labels << Post.find( t.post_id ).title      
      else
        labels << "Frontpage"
      end
    end
    result = [labels]
    12.times do |t|
      row = [ t.weeks.ago.strftime('%d %b'), Pageview.total_from_to( (t+1).weeks.ago, t.weeks.ago ) ]
      t5.each do |p|
        row << Pageview.total_from_to_post( (t+1).weeks.ago, t.weeks.ago, p.post_id )
      end 
      result << row 
    end

    return result
  end

  def self.days
   
    labels = ["Date", "Total"]
    t5 = self.top5( 14.days.ago, 0.days.ago )
    t5.each do |t|
      if t.post_id then
        labels << Post.find( t.post_id ).title      
      else
        labels << "Frontpage"
      end
    end
    result = [labels]
    7.times do |t|
      row = [ t.days.ago.strftime('%d %b'), Pageview.total_from_to( (t+1).days.ago, t.days.ago ) ]
      t5.each do |p|
        row << Pageview.total_from_to_post( (t+1).days.ago, t.days.ago, p.post_id )
      end 
      result << row 
    end

    return result
  end

  def self.hours

    labels = ["Date", "Total"]
    t5 = self.top5( 48.hours.ago, 0.hours.ago )
    t5.each do |t|
      if t.post_id then
        labels << Post.find( t.post_id ).title      
      else
        labels << "Frontpage"
      end
    end
    result = [labels]
    12.times do |t|
      row = [ t.hours.ago.strftime("%H:00"), Pageview.total_from_to( (t+1).hours.ago, t.hours.ago ) ]
      t5.each do |p|
        row << Pageview.total_from_to_post( (t+1).hours.ago, t.hours.ago, p.post_id )
      end 
      result << row 
    end

    return result
  end

  def self.quarters
   
    labels = ["Date", "Total"]
    t5 = self.top5( 36.months.ago, 0.months.ago )
    t5.each do |t|
      if t.post_id then
        labels << Post.find( t.post_id ).title      
      else
        labels << "Frontpage"
      end
    end
    result = [labels]
    4.times do |t|
      row = [ "Q" + ( ( (t*3).months.ago.month / 3 ).floor + 1 ).to_s + " " + (t*3).months.ago.strftime("%Y"), Pageview.total_from_to( ((t+1)*3).months.ago, (t*3).months.ago ) ]
      t5.each do |p|
        row << Pageview.total_from_to_post( ((t+1)*3).months.ago, (t*3).months.ago, p.post_id )
      end 
      result << row 

    end

    return result
  end

  def self.years
   
    labels = ["Year", "Total"]
    t5 = self.top5( 10.years.ago, 0.years.ago )
    t5.each do |t|
      if t.post_id then
        labels << Post.find( t.post_id ).title      
      else
        labels << "Frontpage"
      end
    end
    result = [labels]
    5.times do |t|
      row = [ t.years.ago.year.to_s, Pageview.total_from_to( (t+1).years.ago, t.years.ago ) ]
      t5.each do |p|
        row << Pageview.total_from_to_post( (t+1).years.ago, t.years.ago, p.post_id )
      end 
      result << row 

    end

    return result
  end

  

end

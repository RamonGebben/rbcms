class Post < ActiveRecord::Base
    has_attached_file :image, :styles => { :medium => "900x500#", :thumb => "140x140#" }
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    before_save do
      self.sticky ||= false
      true
    end

    def smart_image
      if self.image.present? then
        self.image(:medium)
      else
        "/images/#{1+(self.id % 10)}.jpg"
      end
    end

    def self.skeleton
     p = Post.where( :static => "default" ).first 
     unless p then
       page_string = ""
       open("https://raw.githubusercontent.com/RamonGebben/markdown-ipsum/master/cupcake-ipsum.md") do |f|
         page_string = f.read
       end
       p = Post.create :static => "default", :title => "Default Template", :content => page_string
     end
     return p
    end

    def self.static_page( n )
      Post.where( :static => n ).first 
    end

    def self.smart_page( n )
      p = Post.where( :static => n ).first 
      unless p then 
         skeleton = Post.skeleton
         p = Post.new( :static => n, :title => n, :content => skeleton.content, :lead => skeleton.lead  )
      end
      return p
    end

end

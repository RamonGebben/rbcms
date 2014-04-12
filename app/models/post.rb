class Post < ActiveRecord::Base
    has_attached_file :image, :styles => { :medium => "500x500#", :thumb => "140x140#" }, :default_url => "http://lorempixel.com/140/140/abstract/"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end

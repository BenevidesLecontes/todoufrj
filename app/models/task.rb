class Task < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :content, presence: true
    has_attached_file :file, :styles => {
                                 :medium => { :geometry => "640x480", :format => 'mp4' },
                                 :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
                             }, :processors => [:transcoder]
	do_not_validate_attachment_file_type :file
	auto_html_for :content do
		html_escape
		image
		youtube(:width => "100%", :height => 250, :autoplay => false)
		link :target => "_blank", :rel => "nofollow"
		simple_format
	end

	scope :recent, ->{where('created_at > ?', 1.hour.ago)}
	scope :old, ->{where('created_at <= ?', 1.hour.ago)}
end

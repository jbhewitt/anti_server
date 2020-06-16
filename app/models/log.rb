class Log < ApplicationRecord
#  attr_accessor :remove_screenshot
#  after_save { screenshot.purge if remove_screenshot.present? }
#  field :screenshot, :active_storage
	
	#  mount_uploaders :screenshots, ScreenshotUploader
#  mount_uploaders :files, FileUploader
  mount_uploader :screenshots, ScreenshotUploader
  mount_uploader :files, FileUploader
#  serialize :screenshots, JSON # If you use SQLite, add this line.
#  serialize :files, JSON # If you use SQLite, add this line.
  belongs_to :player
end

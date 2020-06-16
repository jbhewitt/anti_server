class Log < ApplicationRecord
  mount_uploader :screenshots, ScreenshotUploader
  mount_uploader :files, FileUploader
#  serialize :screenshots, JSON # If you use SQLite, add this line.
#  serialize :files, JSON # If you use SQLite, add this line.
  belongs_to :player
end

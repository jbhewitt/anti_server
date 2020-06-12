class Log < ApplicationRecord
  mount_uploaders :screenshots, ScreenshotUploader
  mount_uploaders :files, FileUploader
  serialize :screenshots, JSON # If you use SQLite, add this line.
  serialize :files, JSON # If you use SQLite, add this line.
  belongs_to :player
end

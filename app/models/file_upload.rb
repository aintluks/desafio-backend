class FileUpload < ApplicationRecord
  has_one_attached :csv_file

  scope :find_by_filename, -> (filename) { where(filename: filename) }

  after_save :set_filename

  def csv
    ActiveStorage::Blob.service.send(:path_for, csv_file.key)
  end

  def set_filename
    update_column(:filename, csv_file.filename.to_s)
  end
end
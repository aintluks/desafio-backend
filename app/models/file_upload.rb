class FileUpload < ApplicationRecord
  has_one_attached :csv_file

  def csv
    ActiveStorage::Blob.service.send(:path_for, csv_file.key)
  end
end
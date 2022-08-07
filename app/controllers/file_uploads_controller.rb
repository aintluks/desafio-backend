class FileUploadsController < ApplicationController
  def create
    @file_upload = FileUpload.new(file_upload_params)

    if @file_upload.save
      CsvHandler.perform(csv: @file_upload.csv)
      redirect_to root_path
    end
  end

  private
  
  def file_upload_params
    params.require(:file_upload).permit(:csv_file)
  end
end
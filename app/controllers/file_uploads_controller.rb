class FileUploadsController < ApplicationController
  def create
    @file_upload = FileUpload.new(file_upload_params)
    @file_exists = FileUpload.where(filename: file_upload_params[:csv_file].original_filename)

    if !@file_exists.present? && @file_upload.save
      CsvImporter.perform(csv: @file_upload.csv)
    else
      flash[:alert] = "Arquivo já existe."
    end

    redirect_to root_path
  end

  private

  def file_upload_params
    params.require(:file_upload).permit(:csv_file)
  end
end
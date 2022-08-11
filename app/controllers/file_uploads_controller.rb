class FileUploadsController < ApplicationController
  def create
    @params = file_upload_params
    @file_upload = FileUpload.new(@params)

    if valid_file
      CsvImporterJob.perform_async(@file_upload.csv)
      flash[:alert] = t('notices.file_to_queue')
    else
      flash[:alert] = t('notices.file_exists')
    end

    redirect_to root_path
  end

  private

  def valid_file
    file = FileUpload.find_by_filename(@params[:csv_file].original_filename)

    !file.present? && @file_upload.save
  end

  def file_upload_params
    params.require(:file_upload).permit(:csv_file)
  end
end
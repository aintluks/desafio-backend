class DeputiesController < ApplicationController
  def index
    @file_upload = FileUpload.new
  end
end
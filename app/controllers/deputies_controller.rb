class DeputiesController < ApplicationController
  def index
    @file_upload = FileUpload.new
    @deputies = Deputy.all
  end
end
require 'rails_helper'

RSpec.describe FileUploadsController do
  describe 'POST#create' do
    let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'dados-abertos.csv'), 'text/csv') }

    let(:params) do
      {
        file_upload: {
          csv_file: file
        }
      }
    end

    it 'creates a new FileUpload' do
      expect(CsvImporter).to receive(:perform).with(anything)

      expect { post :create, params: params }.to change(FileUpload, :count).by(1)
    end

    it 'does not create duplicated FileUpload' do
      expect { post :create, params: params }.to change(FileUpload, :count).by(1)
      expect { post :create, params: params }.not_to change(FileUpload, :count)
    end
  end
end
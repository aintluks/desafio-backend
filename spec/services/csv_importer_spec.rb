require 'rails_helper'

RSpec.describe CsvImporter do
  describe '.perform' do
    let(:file_upload) { "#{Rails.root}/spec/fixtures/dados-abertos.csv" }

    context 'uploads a valid csv file' do
      subject { described_class.perform(file_upload) }

      it 'creates 3 deputies' do
        expect { subject }.to change { Deputy.count }.by(3)
      end

      it 'creates 30 expenses' do
        expect { subject }.to change { Expense.count }.by(30)
      end
    end
  end
end
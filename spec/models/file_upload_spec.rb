require 'rails_helper'

RSpec.describe FileUpload, type: :model do
  context 'relashionships' do
    it { is_expected.to have_one_attached :csv_file }
  end
end

class CsvImporterJob
  include Sidekiq::Job

  def perform(csv)
    CsvImporter.perform(csv)
  end
end

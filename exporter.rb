require 'dotenv/load'
require 'contentful/management'

module GraphCms
  class Exporter
    SUPPORTED_CMS = ['contentful'].freeze

    def initialize(origin_cms:, credentials:)
      unless SUPPORTED_CMS.include?(origin_cms)
        puts "This only supports #{SUPPORTED_CMS.join(', ')} as valid options"
        return
      end

      send("export_from_#{origin_cms}", credentials)
    end

    def export_from_contentful(credentials)
      client = Contentful::Management::Client.new(credentials[:management_key])

      entry = client.environments(credentials[:space_id]).find('master').entries
    end
  end

  class Importer

  end
end
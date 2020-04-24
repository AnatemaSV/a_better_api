# frozen_string_literal: true

desc 'get info from FUNDE'

task get_funde_requests: :environment do
  response = RestClient.get 'https://alac.funde.org/api/v1/requests?startdate=2000-01-01&enddate=2020-12-31&page=0&limit=1000'
  json = JSON.parse response

  unless json.blank?
    @inforequests = json

    @inforequests.each do |i|
      inforequest = Inforequest.new

      inforequest._id = i['_id']
      inforequest.case_id = i['case_id']
      inforequest.comment = i['comment']
      inforequest.date = i['date']
      inforequest.detail = i['detail']
      inforequest.finish = i['finish']
      inforequest.office = i['office']
      inforequest.office_id = i['office_id']
      inforequest.overview = i['overview']
      inforequest.ref = i['ref'].to_i
      inforequest.result = i['result']
      inforequest.start = i['start']
      inforequest.status = i['status']
      inforequest.url = i['url']

      if inforequest.save
        puts "Importando request: #{inforequest._id}"

        i['documents'].each do |d|
          document = inforequest.documents.new
          document._id = d['_id']
          document.date = d['date']
          document.downloaded = d['downloaded'].to_i
          document.overview = d['overview']
          document.path = d['path']
          document.tags = d['tags'].split(' ').join(', ')
          document.title = d['title']

          if document.save
            puts "  agregando documento: #{document._id}"
          else
            puts "  ERROR / agregando documento: #{document._id}"
            puts "  #{document.errors.inspect}"
          end
        end

        i['updates'].each do |u|
          update = inforequest.updates.new
          update.date = u['date']
          update.details = u['detail']

          if update.save
            puts "  - agregando update: #{update.date}"
          else
            puts "  * ERROR / agregando update: #{update.date}"
          end
        end

      else
        # puts podcast.errors.inspect
      end
    end
  end
end

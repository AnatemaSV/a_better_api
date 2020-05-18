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
      inforequest.office = i['office'].strip
      inforequest.office_id = i['office_id']
      inforequest.overview = i['overview']
      inforequest.ref = i['ref'].to_i
      inforequest._result = i['result'].strip
      inforequest.start = i['start']
      inforequest._status = i['status'].strip
      inforequest.url = i['url']

      if inforequest.save
        puts "adding inforequest: #{inforequest._id}"

        documents = []
        i['documents'].each do |d|
          document = Document.new
          document._id = d['_id']
          document.date = d['date']
          document.downloaded = d['downloaded'].to_i
          document.overview = d['overview']
          document.path = d['path']
          document.tags = d['tags'].split(' ').join(', ')
          document.title = d['title']

          document_ = Document.find_by__id(d['_id'])
          if document_.nil?
            if document.save
              puts "  + adding document: #{document._id}"
              documents.push(document.id)
            else
              puts "  ERROR / adding document: #{document._id}"
              document.errors.full_messages.each do |e|
                puts "    * #{e}"
              end
            end
          else
            documents.push(document_.id)
          end
        end

        inforequest.document_ids = documents
        inforequest.documents.each do |doc|
          puts "    * check: #{doc._id}"
        end

        i['updates'].each do |u|
          update = inforequest.updates.new
          update.date = u['date']
          update.details = u['detail']

          if update.save
            puts "  - adding update: #{update.date}"
          else
            puts "  * ERROR / adding update: #{update.date}"
          end
        end

      else
        puts "ERROR / inforequest: #{inforequest._id}"
        inforequest.errors.full_messages.each do |e|
          puts "  #{e}"
        end
      end
    end
  end
end

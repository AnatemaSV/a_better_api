# frozen_string_literal: true

desc 'get info from FUNDE'
task get_funde_complains: :environment do
  date_ranges = ['https://alac.funde.org/api/v1/complains?startdate=2000-01-01&enddate=2014-06-03&page=0&limit=1000',
                 'https://alac.funde.org/api/v1/complains?startdate=2014-06-05&enddate=2016-06-26&page=0&limit=1000',
                 'https://alac.funde.org/api/v1/complains?startdate=2016-06-28&enddate=2020-12-31&page=0&limit=1000']

  date_ranges.each do |query|
    response = RestClient.get query
    json = JSON.parse response

    next if json.blank?

    @infocomplains = json

    @infocomplains.each do |i|
      infocomplain = Infocomplain.new

      infocomplain._id = i['_id']
      infocomplain.case_id = i['case_id']
      infocomplain.comment = i['comment']
      infocomplain.date = i['date']
      infocomplain.detail = i['detail']
      infocomplain.finish = i['finish']
      infocomplain.office = i['office'].strip
      infocomplain.office_id = i['office_id']
      infocomplain.overview = i['overview']
      infocomplain.reviewer = i['reviewer']
      infocomplain.reviewer_id = i['reviewer_id']
      infocomplain.ref = i['ref'].to_i
      infocomplain._result = i['result'].strip
      infocomplain.start = i['start']
      infocomplain._status = i['status'].strip
      infocomplain.url = i['url']

      if infocomplain.save
        puts "adding infocomplain: #{infocomplain._id}"

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

        infocomplain.document_ids = documents
        infocomplain.documents.each do |doc|
          puts "    * check: #{doc._id}"
        end

        i['updates'].each do |u|
          update = infocomplain.updates.new
          update.date = u['date']
          update.details = u['detail']

          if update.save
            puts "  - adding update: #{update.date}"
          else
            puts "  * ERROR / adding update: #{update.date}"
          end
        end

      else
        puts "ERROR / infocomplain: #{infocomplain._id}"
        infocomplain.errors.full_messages.each do |e|
          puts "  #{e}"
        end
      end
    end
  end
end

desc 'check complains from FUNDE'
task check_funde_complaints: :environment do
  (2012...2020).each do |year|
    (1...13).each do |month|
      days = Time.days_in_month(month, year) + 1
      (1...days).each do |day|
        query = "https://alac.funde.org/api/v1/complains?startdate=#{year}-#{format '%02d', month}-#{format '%02d', day}&enddate=#{year}-#{format '%02d', month}-#{format '%02d', day}&page=0&limit=1000"
        response = RestClient.get query
        json = JSON.parse response

        # puts json
        # if !json.empty? && json.json['message']
        # puts json['message']
        # puts "#{year}-#{sprintf '%02d', month}-#{sprintf '%02d', day}"
        # end
      rescue StandardError => e
        puts "#{year}-#{format '%02d', month}-#{format '%02d', day}"
        puts e.response
      end
    end
  end
end

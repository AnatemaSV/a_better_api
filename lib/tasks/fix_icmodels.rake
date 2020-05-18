# frozen_string_literal: true

desc 'Fix infocomplains models to serve API'

task fix_infocomplain_models: :environment do
  puts 'Populate model Institutions'
  Infocomplain.select('DISTINCT office_id').select(:office).order("office ASC").each do |i|
    institution = Institution.new
    institution.name = i.office.strip
    institution.office_id = i.office_id

    if institution.save
      puts "  Adding Institution: #{institution.name} / #{institution.office_id}"
    else
      puts "  ERROR Institution: #{institution.name} / #{institution.office_id}"
      institution.errors.full_messages do |e|
        puts "    * #{e}"
      end
    end
  end

  puts 'Relation Infocomplain / Institution'
  Infocomplain.all.each do |ic|
    institution = Institution.find_by_office_id(ic.office_id)
    ic.institution_id = institution.id
    ic.save

    if ic.save
      puts "Relation infocomplain: #{ic._id} institution: #{ic.institution.name}"
    else
      puts "ERROR infocomplain: #{ic._id}"
      i.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end

  puts 'Populate model icresults'
  Infocomplain.pluck(:_result).uniq.sort.each do |r|
    result = Icresult.new
    result.name = r
    if result.save
      puts "Adding result: #{result.name}"
    else
      result.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end

  Infocomplain.all.each do |ic|
    result = Icresult.find_by_name(ic._result)
    ic.icresult_id = result.id

    if ic.save
      puts "Relation infocomplain: #{ic._id} result: #{ic.icresult.name}"
    else
      puts "ERROR infocomplain: #{ic._id}"
      ic.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end

  # puts 'Populate model statuses'
  # Infocomplain.pluck(:_status).uniq.sort.each do |s|
  #   status = Status.new
  #   status.name = s
  #   if status.save
  #     puts "Adding status: #{status.name}"
  #   else
  #     result.errors.full_messages do |e|
  #       puts "  * #{e}"
  #     end
  #   end
  # end

  Infocomplain.all.each do |ic|
    status = Status.find_by_name(ic._status)
    ic.status_id = status.id

    if ic.save
      puts "Relation infocomplain: #{ic._id} status: #{ic.status.name}"
    else
      puts "ERROR infocomplain: #{ic._id}"
      ic.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end
end

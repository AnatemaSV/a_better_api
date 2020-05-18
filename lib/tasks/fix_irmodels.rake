# frozen_string_literal: true

desc 'Fix inforequests models to serve API'

task fix_inforequest_models: :environment do
  puts 'Populate model Institutions'
  Inforequest.select('DISTINCT office_id').select(:office).order("office ASC").each do |i|
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

  puts 'Relation Inforequest / Institution'
  Inforequest.all.each do |ir|
    institution = Institution.find_by_office_id(ir.office_id)
    ir.institution_id = institution.id
    ir.save

    if ir.save
      puts "Relation inforequest: #{ir._id} institution: #{ir.institution.name}"
    else
      puts "ERROR inforequest: #{ir._id}"
      i.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end

  puts 'Populate model results'
  Inforequest.pluck(:_result).uniq.sort.each do |r|
    result = Result.new
    result.name = r
    if result.save
      puts "Adding result: #{result.name}"
    else
      result.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end

  Inforequest.all.each do |ir|
    result = Result.find_by_name(ir._result)
    ir.result_id = result.id

    if ir.save
      puts "Relation inforequest: #{ir._id} result: #{ir.result.name}"
    else
      puts "ERROR inforequest: #{ir._id}"
      i.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end

  puts 'Populate model statuses'
  Inforequest.pluck(:_status).uniq.sort.each do |s|
    status = Status.new
    status.name = s
    if status.save
      puts "Adding status: #{status.name}"
    else
      result.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end

  Inforequest.all.each do |ir|
    status = Status.find_by_name(ir._status)
    ir.status_id = status.id

    if ir.save
      puts "Relation inforequest: #{ir._id} status: #{ir.status.name}"
    else
      puts "ERROR inforequest: #{ir._id}"
      i.errors.full_messages do |e|
        puts "  * #{e}"
      end
    end
  end
end

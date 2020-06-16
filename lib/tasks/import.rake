require 'csv'

namespace :import do
  desc "import users from csv"
  task :players => :environment do
    csv_text = File.read(Rails.root.join('/tmp/playerinfo.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
      if row['Alias'] == ''
	      next
      else
        puts row
#	row.pry
	p = Player.find_or_create_by(name: row['Alias'], lastname: row['Last Name'], firstname: row['First name'] )
        p.firstname = row['First Name']
        p.lastname = row['Last Name']
        p.phash = row['SHA-256 Hash']
        t = Team.find_or_create_by(name: row['Team'])
        t.league = row['League']
        t.save
        p.team = t
#	p.pry
        p.save
        puts "#{p.name} saved"
      end
    end

  end
end

#putsi "There are now #{Transaction.count} rows in the transactions table"

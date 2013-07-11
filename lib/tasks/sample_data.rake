namespace :db do

  desc "Fill database with sample data"
  task :populate => :environment do

        Station.all(:limit => 6).each do |station|
          50.times do
            station.modems.create!(:content => Faker::Lorem.sentence(5))
          end
        end
  end
end
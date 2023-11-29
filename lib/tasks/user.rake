namespace :user do
  desc "Enrich with clearbit API (async thanks to sidekiq)"
  task update_all: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users.."
    users.each do |user|
      FakeJob.perform_later(user)
    end
  end
  task update_one: :environment do
    user = User.find(ENV["USER_ID"])
    puts "Enqueuing update for #{user.email} .."
    FakeJob.perform_later(user)
  end
end

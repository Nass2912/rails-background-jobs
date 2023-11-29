class FakeJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts puts "Calling Clearbit API for #{user.email}..."
    sleep 3
    puts "Done! Enriched #{user.email} with Clearbit"
    # Do something later
  end
end

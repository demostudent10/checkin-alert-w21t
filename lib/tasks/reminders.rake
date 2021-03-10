task({ :hello => :environment }) do
  cutoff_time = 24.hours.from_now + 15.minutes

  within_window = Flight.where("departs_at < ?", cutoff_time)

  need_reminders = within_window.where({ :alert_sent => false })

  need_reminders.each do |a_flight|
    p a_flight.description
    p a_flight.departs_at
    # Send a message via Twilio
    p a_flight.user.phone_number

    a_flight.alert_sent = true
    a_flight.save
  end

end
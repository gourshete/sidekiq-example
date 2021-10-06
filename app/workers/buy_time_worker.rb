# frozen_string_literal: true

# The worker
class BuyTimeWorker
  include Sidekiq::Worker

  def perform(name, sec)
    # Below is the expensive processing that needs to be off-loaded to a job worker.
    p "Hey #{name}, going to sleep for #{sec} secs."
    sleep(sec)
    p 'It was quite a long nap.'
  end
end

class BuyTimeWorker
  include Sidekiq::Worker

  def perform(name, sec)
    p "Hey #{name}, going to sleep for #{sec}."
    sleep(sec*1000)
    p "I was quite long nap."
  end

end
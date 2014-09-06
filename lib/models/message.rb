class Message
  def self.all_from(me, from)
    Nest.new("caye", $redis)[me][from].lrange(0, -1).map do |message|
      JSON.parse(message)
    end
  end

  def self.all(me, from)
    (all_from(me, from) + all_from(from, me)).sort do |message1, message2|
      message1["timestamp"] <=> message2["timestamp"]
    end
  end
end

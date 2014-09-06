class User
  def self.all
    Nest.new("caye", $redis)["users"].smembers.map do |user|
      { from: user }
    end
  end
end

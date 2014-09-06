class User
  def self.all
    Nest.new("caye")["users"].smembers.map do |user|
      { from: user }
    end
  end
end

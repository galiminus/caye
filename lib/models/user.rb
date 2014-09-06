class User
  def self.all
    $redis["users"].smembers.map do |user|
      { from: user }
    end
  end

  def self.store(params)
    $redis["users"].sadd params["from"] if valid?(params)
  end

  private
  def self.valid?(params)
    %w[from].all? do |param|
      params.try(:[], param)
    end
  end
end

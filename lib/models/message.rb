class Message
  def self.all(params)
    path(params).zrangebyscore(params[:start].to_i, "(#{params[:end].to_i}").map do |message|
      JSON.parse(message)
    end
  end

  def self.store(params)
    path(params).zadd(params["timestamp"], params.to_json) if valid?(params)
  end

  private

  def self.valid?(params)
    %w[from to timestamp body].all? do |param|
      params.try(:[], param)
    end
  end

  def self.path(params)
    params['from'] < params['to'] ? $redis[params['from']][params['to']] : $redis[params['to']][params['from']]
  end
end

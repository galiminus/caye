class StoreMessages
  def incoming(message, callback)
    if (data = message["data"]) && data["to"] && data["from"]
      data["timestamp"] = Time.new.to_i
      Nest.new("caye")[data["to"]][data["from"]].lpush data.to_json
    end
    callback.call(message)
  end
end

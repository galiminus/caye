class StoreUsers
  def incoming(message, callback)
    if message["data"] && message["data"]["from"]
      Nest.new("caye")["users"].sadd message["data"]["from"]
    end
    callback.call(message)
  end
end

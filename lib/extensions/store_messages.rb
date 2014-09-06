class StoreMessages
  def incoming(message, callback)
    Message.store(message["data"])
    callback.call(message)
  end
end

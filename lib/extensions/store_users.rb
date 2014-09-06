class StoreUsers
  def incoming(message, callback)
    User.store message["data"]
    callback.call(message)
  end
end

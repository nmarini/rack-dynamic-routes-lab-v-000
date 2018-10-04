class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    # item_name = req.params["q"]

    if req.path.match(/items/)
      item_name = req.path("/item/").split.last
      if item = Item.find(item_name)
        resp.write "#{item.name}\n #{item.price}"
      else
      # Item.all.map do |i|
      #   if i.name == item
      #     resp.write "#{i.name} #{i.price}\n"
      #   else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
  end
end

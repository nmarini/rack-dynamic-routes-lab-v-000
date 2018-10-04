class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item = req.params["q"]
binding.pry
    if req.path.match(/items/)
      Items.all.map do |i|
        if i.name == item
          resp.write "#{i.name} #{i.price}\n"
        else
          resp.status = 400
          resp.write "Item not found"
        end
    else
      resp.status = 404
      resp.write "Route not found"
    end
  end
end

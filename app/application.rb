class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item = req.param["q"]

    if req.path.match(/items/)

  end
end

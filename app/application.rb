class application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/item"
      resp.write ""
  end

end

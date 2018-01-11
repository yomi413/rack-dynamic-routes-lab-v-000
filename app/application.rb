class Application

  @@items = []
  binding.pry

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/item"
      resp.write ""
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end

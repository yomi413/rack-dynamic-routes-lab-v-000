class Application

  @@items = [Item.new("#{name}", "#{price}")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = 

    if req.path == "/item"
      resp.write ""
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end

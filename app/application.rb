class Application

  @@items = [Item.new(item.name, item.price)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)



    @@items.each do |item|

      if req.path == "/item"
        resp.write "#{item.price}"
      else
        resp.write "Route not found"
        resp.status = 404
      end
    end

    resp.finish
  end

end

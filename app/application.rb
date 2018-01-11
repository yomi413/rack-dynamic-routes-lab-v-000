class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items.each do |item|
      @@items << Item.new(item.name, item.price)

      if req.path.match == (/item/)
        resp.write "#{item.name}, #{item.price}"
      else
        resp.write "Route not found"
        resp.status = 404
      end
    end

    resp.finish
  end

end

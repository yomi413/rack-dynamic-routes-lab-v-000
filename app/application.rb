class Application

  @@items = [Item.new("#{item.name}", "#{item.price}")]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.params["item"]
      if @@items.include?(item)

        resp.write "#{item_price}\n"
      # end
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end

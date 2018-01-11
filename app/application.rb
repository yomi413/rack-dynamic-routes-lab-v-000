class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.params["item"]
      if @@items.include?(item)
        @@items.each do |item|
          item.each.with_index(1) do |existing_item, index|
            item_price = existing_item[1]
            resp.write "#{item_price}\n"
          end
        end
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

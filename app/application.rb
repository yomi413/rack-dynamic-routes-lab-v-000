class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        # @@items << (item.name, item.price)
        # item_name = req.path.split("/items/")
        resp.write "#{item.price}\n"
      end
      if !item.exists?
    # if req.path.match(/items/)
    #   item_name = req.path.split("/items/").last
    #   item = @@items.find{|i| i.name == item_name}
    #   resp.write "#{item.price}"
    #   if @@items
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

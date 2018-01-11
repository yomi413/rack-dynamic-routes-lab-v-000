class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      resp.write item.price
    # end

    # @@items.each do |item|
    #   resp.write "#{item.price}\n"

      # if req.path == "/items"
      #   resp.write "Item not found"
      else
        resp.write "Route not found"
        resp.status = 404
      end

    # @@items.each do |item|
    #   @@items << Item.new(item.name, item.price)
    #
      # if req.path.match(/item/)
      #   resp.write "#{item.price}"
      # else
      #   resp.write "Route not found"
      #   resp.status = 404
      # end
    # end

    resp.finish
  end

end

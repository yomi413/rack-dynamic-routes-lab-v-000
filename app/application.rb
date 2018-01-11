class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        if !item.include?(name: "Apples")
          resp.write "Item not found"
          resp.status = 400
        end
      resp.write "#{item.price}\n"
    end
    # elsif !@@items.include?(item)
    #   resp.write "Item not found"
    #   resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end

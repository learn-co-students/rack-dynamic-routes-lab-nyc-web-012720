class Application
    @@items = []
    def call(env)
        resp = Rack::Response.new 
        req = Rack::Request.new(env)

        item = req.path.split("/") 
        result = @@items.find{|first| first.name == item.last}
        path = item.include?("items")

    if path != false && result != nil
        resp.write result.price
        resp.status = 200
    elsif path == false
        resp.write "Route not found"
        resp.status = 404
    else
        resp.write "Item not found"
        resp.status = 400       
    end
    resp.finish
    end
end
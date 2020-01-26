class LoginController < ApplicationController
  def login
    if verify
      @user_data = User.new 
      @user_data.name = params[:Username]
      @user_data.password = params[:Password]
      @user_data.port = params[:portnumber]
    else
      puts "error"
    end
    render
  end
  def verify
    puts params[:portnumber]
    uri = URI.parse("http://127.0.0.1:10942")
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(params[:Username], params[:Password])
    request.content_type = "text/plain;"
    request.body = JSON.dump({
      "jsonrpc" => "1.0",
      "id" => "curltest",
      "method" => "getinfo",
      "params" => []
    })

    req_options = {
        use_ssl: uri.scheme == "https",
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    
    puts request.body
    puts response.body

    return true if response.body.include?(',"error":null,') 
    return false
  end
end
class AddressController < ApplicationController
    def address
    end
    def addressbalance
    end
    def snapshotwallet
    end
    def addressbalancesuccess
    
      puts params[:portnumber]
      uri = URI.parse("http://127.0.0.1:" +  session[:user_data_port])
      request = Net::HTTP::Post.new(uri)
      request.basic_auth(session[:user_data_name], session[:user_data_password])
      request.content_type = "text/plain;"
      request.body = JSON.dump({
        "jsonrpc" => "1.0",
        "id" => "curltest",
        "method" => "getaddressbalance",
        "params" => [params[:balanceparam]]
      })
  
      req_options = {
          use_ssl: uri.scheme == "https",
      }
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      
      @request= request.body
      @response = response.body
  
      return true if response.body.include?(',"error":null,') 
      return false

    end
  end
require 'nancy'
require 'rack/contrib'

class App < Nancy::Base
  include Nancy::Render

  use Rack::NestedParams

  get "/" do
    "Hello World"
  end

  # Merchant index
  get '/merchants' do
    render('merchants/index', :layout => 'merchants')
  end

  # Register as new merchant
  get '/merchants/new' do
    render('merchants/new', :layout => 'merchants')
  end

  # Show one merchant
  get '/merchants/:id' do
    render('merchants/show', :layout => 'merchants')
  end

  # Create merchant
  post '/merchants' do
    params.inspect
    #merchant = Merchant.new(params["user"])
  end

  put "/merchants/:id" do

  end

  def render(view, options = {})
    if layout = options[:layout]
      super("views/layouts/#{layout}.erb") { super("views/#{view}.erb") }
    else
      super("views/#{view}.erb")
    end
  end
end

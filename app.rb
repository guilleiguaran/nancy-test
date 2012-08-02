require 'nancy'
require 'rack/contrib'
require 'active_record'
require './app/models/merchant'

class App < Nancy::Base
  include Nancy::Render
  use Rack::NestedParams
  use Rack::MethodOverride
  ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml'))['development'])

  get "/" do
    "Hello World"
  end

  # Merchant index
  get '/merchants' do
    @merchants = Merchant.all
    render('merchants/index', :layout => 'merchants')
  end

  # Register as new merchant
  get '/merchants/new' do
    @merchant = Merchant.new
    render('merchants/new', :layout => 'merchants')
  end

  # Show one merchant
  get '/merchants/:id' do
    @merchant = Merchant.find(params['id'])
    render('merchants/show', :layout => 'merchants')
  end

  # Edit one merchant
  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params['id'])
    render('merchants/edit', :layout => 'merchants')
  end

  # Create merchant
  post '/merchants' do
    @merchant = Merchant.new(params['merchant'])
    if @merchant.save
      redirect "/merchants/#{@merchant.id}"
    else
      render('merchants/new', :layout => 'merchants')
    end
  end

  put "/merchants/:id" do
    @merchant = Merchant.find(params['id'])
    if @merchant.update_attributes(params['merchant'])
      redirect "/merchants/#{@merchant.id}"
    else
      render('merchants/edit', :layout => 'merchants')
    end
  end

  delete "/merchants/:id" do
    @merchant = Merchant.find(params['id'])
    @merchant.destroy
    redirect "/merchants"
  end

  def render(view, options = {})
    if layout = options[:layout]
      super("app/views/layouts/#{layout}.erb") { super("app/views/#{view}.erb") }
    else
      super("app/views/#{view}.erb")
    end
  end
end

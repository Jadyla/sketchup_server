require 'sinatra'
require 'json'
require 'faye/websocket'

set :server, 'puma'
set :sockets, []
set :bind, '0.0.0.0'

get '/' do
  "VRX"
end

get '/paint' do
  # Receber parâmetros da URL
  if params['texture']
    texture = params['texture']
    entity_attr = params['touch']

  end
end

get '/texture' do
    texture = params['texture']
    entity_attr = params['touch']

    File.open('C:\Users\Amoradev\AppData\Roaming\SketchUp\SketchUp 2021\SketchUp\Plugins\command.txt', 'w') do |file|
      file.puts "Sketchup::VRX::CustomizeModel.apply_texture('#{texture}.png', '#{entity_attr}')"
    end
end

get '/update' do
  project = params['project']
  view = params['view']

  File.open('C:\Users\Amoradev\AppData\Roaming\SketchUp\SketchUp 2021\SketchUp\Plugins\command.txt', 'w') do |file|
    file.puts "Sketchup::VRX::Screenshot.screenshot_sketchup('#{project}', '#{view}')"
  end
end

get '/open_sketchup' do
  project = params['project']
  sketchup_path = "C:\\Program Files\\SketchUp\\SketchUp 2021\\SketchUp.exe"
  skp_file_path = "C:\\Users\\Amoradev\\AppData\\Roaming\\SketchUp\\SketchUp 2021\\SketchUp\\Plugins\\enviroments\\#{project}.skp\""

  system("start \"\" \"#{sketchup_path}\" \"#{skp_file_path}\"")
end

get '/close_sketchup' do
  system("taskkill /IM SketchUp.exe /F")
end

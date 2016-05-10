require 'models/robot_world'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    @robots = RobotWorld.all
    render :index
  end


  def robot_world
    database = YAML::Store.new('db/robot_world')
    @robot_world ||= RobotWorld.new(database)
  end
end

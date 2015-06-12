require 'pathname'

rails_env = 'production'
# 当前文件完整路径，puma.rb放置在config目录下
APP_PATH = Pathname.new(__FILE__).realpath.sub('/config/puma.rb', '').to_s

bind "unix://#{APP_PATH}/tmp/sockets/ruby_cdjump_com.sock"
pidfile "#{APP_PATH}/tmp/pids/ruby_cdjump_com.pid"
rackup "#{APP_PATH}/config.ru"

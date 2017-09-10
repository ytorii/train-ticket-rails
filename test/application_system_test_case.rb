require "test_helper"
require "socket"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400],
    options: { url:"http://chrome:4444/wd/hub" }

  def setup
    host! "http://#{IPSocket.getaddress(Socket.gethostname)}"

    super
  end
  #caps = Selenium::WebDriver::Remote::Capabilities.chrome( "chromeOptions" => { "binary" => '/usr/bin/chromium-browser', "args" => %w(headless no-sandbox disable-gpu) })
  #driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: { desired_capabilities: caps, driver_path: '/usr/bin/chromedriver' }
end

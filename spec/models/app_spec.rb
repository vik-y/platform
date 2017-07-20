require 'spec_helper'

describe App do

  describe "normal app installation" do
    it "installs correctly" do
      app = App.new("normal") # Create an app object
      app.install_bg # Install it
      expect(App.count).to eq(1) # Verifies if app is installed or not
      # TODO: Add test case for config files if needed
      #puts app.webapp.get_conf
    end
  end

  describe "php5 installation" do
    it "installs correctly" do
      app = App.new('php5')
      app.install_bg
      expect(App.count).to eq(1)
    end

    # Clean up to remove the container
    after(:each) do
      puts "removing container"
      c = Docker::Container.get('php5')
      c.stop
      c.remove
    end
  end

  # To add tests for any new kind of app add another describe block here
  # Make sure you create a new testapp and place it inside seeds.rb
end
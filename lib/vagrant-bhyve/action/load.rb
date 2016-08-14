require "log4r"

module VagrantPlugins
  module ProviderBhyve
    module Action
      class Load

	def initialize(app, env)
	  @logger = Log4r::Logger.new("vagrant_bhyve::action::load")
	  @app = app
	end

	def call(env)
	  @machine 	= env[:machine]
	  @driver	= @machine.provider.driver
	  firmware	= @driver.get_attr('firmware')

          env[:ui].detail I18n.t('vagrant_bhyve.action.vm.boot.load_kernel')
	  @driver.load(@machine, env[:ui]) if firmware == 'bios'

	  @app.call(env)
	end
	
      end
    end
  end
end

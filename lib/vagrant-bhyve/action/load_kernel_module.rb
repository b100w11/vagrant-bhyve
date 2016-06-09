require "log4r"

module VagrantPlugins
  module ProviderBhyve
    module Action
      class LoadKernelModule

	def initialize(app, env)
	  @logger = Log4r::Logger.new("vagrant_bhyve::action::load_kernel_module")
	  @app = app
	end

	def call(env)
	  @machine 	= env[:machine]
	  @driver	= @machine.provider.driver
	  module_list 	= %w(vmm nmdm if_bridge if_tap)
	  for kernel_module in module_list
	    driver.load_module(kernel_module)
	  end
	  @app.call(env)
	end

      end
    end
  end
end

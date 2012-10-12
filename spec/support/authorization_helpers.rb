# copy of this helper until 1.2.1
# https://github.com/spree/spree/commit/61d1aafa78bc278efe041c7b50a3202e831d0208

module AuthorizationHelpers
  module Controller
    def stub_authorization!
      before do
        controller.should_receive(:authorize!).twice.and_return(true)
      end
    end
  end

  module Request
    class SuperAbility
      include CanCan::Ability

      def initialize(user)
        # allow anyone to perform index on Order
        can :manage, :all
      end
    end

    def stub_authorization!
      before(:all) { Spree::Ability.register_ability(AuthorizationHelpers::Request::SuperAbility) }
      after(:all) { Spree::Ability.remove_ability(AuthorizationHelpers::Request::SuperAbility) }
    end
  end
end

RSpec.configure do |config|
  config.extend AuthorizationHelpers::Controller, :type => :controller
  config.extend AuthorizationHelpers::Request, :type => :request
end
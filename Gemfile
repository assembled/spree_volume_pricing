source 'http://rubygems.org'

group :test do
  gem 'rspec-rails', '~> 2.11.0'
  gem 'factory_girl', '~> 2.6.4'
  gem 'factory_girl_rails', '~> 1.7'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'guard-rspec'

  if RUBY_PLATFORM.downcase.include? "darwin"
    gem 'rb-fsevent'
    gem 'growl'
  end
end

# for testing https://github.com/iloveitaly/spree_sale_products
# both extensions modify price assignment behaviour
# gem 'spree_sale_products', :path => '../spree_sale_products'
gem 'spree', '~> 1.1.3'

gemspec
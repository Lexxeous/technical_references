# RSpec Coding Reference.rb

# use in project directory to create
# spec/spec_helper.rb &
# .rspec
rspec --init


#create specifications in spec/<class_name>/<spec_name>.rb
require "spec_helper"
require "<class_name>" # to access class and/or methods and/or objects


# you can use "context" as a substitute for "describe"
# they are similar to (alias of) eachother
context
describe


--format documentation # put inside ".rspec" file for better output at the terminal


# can use "simplecov" to get a good idea about test coverage of code
gem install simplecov
# puts these lines at the top of spec_helper.rb
require "simplecov"
SimpleCov.start

# -------------------------------------------------------------------------------------------------
# WITH CAPYBARA

# the gem capybara seemlessly adds functionality to RSpec testing
# it allows the simulation of real world workflow

module ModuleName
  RSpec.describe ClassName do
    describe “the signin process”, type: :feature do
      before :each do
        User.make(email: ‘user@example.com’, password: ‘password’)
      end
      it “signs me in” do
        visit ‘/sessions/new’
        within(“session”) do
          fill_in ‘Email’, with: ‘user@example.com’
          fill_in ‘Password’, with: ‘password’
        end
        click_button ‘Sign in’
        expect(page).to have_content ‘Success’
      end
    end
  end
end

# -------------------------------------------------------------------------------------------------

require "spec_helper"

module ModuleName
  RSpec.describe ClassName do
    context "#anchor_group_1" do
      let(:symbol_var) { ModuleName::ClassName.new.symbol_var}

      it "returns an array." do
        expect(symbol_var.class).to eq(Array)
      end
      it "returns an array with 5 elements." do
        expect(symbol_var.size).to eq(5)
      end

      it "each element is an integer." do
        symbol_var.each do |x|
          expect(x).to be_a(Integer)
        end
      end

      it "each element is less than 60." do
        symbol_var.each do |x|
          expect(x).to be < 60
        end
      end
    end
  end
end


# RSpec Coding Reference.rb

# frozen_string_literal: true

require "spec_helper"

module ModuleName
  RSpec.describe ClassName do
    describe "#anchor_group_1" do
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


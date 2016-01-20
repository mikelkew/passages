require 'spec_helper'

module Passages
  describe Config do
    describe '#no_auth?' do
      context '@basic_auth is a truthy value' do
        [true, 'yes', ['1'], { a: :b }].each do |value|
          it "#{ value } returns true" do
            Passages.config.no_auth = value
            expect(Passages.config.no_auth?).to eq(true)
          end
        end
      end

      context '@basic_auth is a falsey value' do
        [false, nil].each do |value|
          it "#{ value } returns false" do
            Passages.config.no_auth = value
            expect(Passages.config.no_auth?).to eq(false)
          end
        end
      end
    end

    describe '#enable_cache?' do
      context '@enable_cache is a truthy value' do
        [true, 'yes', ['1'], { a: :b }].each do |value|
          it "#{ value } returns true" do
            Passages.config.enable_cache = value
            expect(Passages.config.enable_cache?).to eq(true)
          end
        end
      end

      context '@enable_cache is a falsey value' do
        [false, nil].each do |value|
          it "#{ value } returns false" do
            Passages.config.enable_cache = value
            expect(Passages.config.enable_cache?).to eq(false)
          end
        end
      end
    end
  end
end

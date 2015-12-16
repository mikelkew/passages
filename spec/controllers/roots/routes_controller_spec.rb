require 'spec_helper'
require 'action_dispatch/routing'
require 'rails'

require_relative '../../../lib/roots/engine'
require_relative '../../../app/controllers/roots/routes_controller'

module Roots
  describe RoutesController do

    describe '#routes' do
      before do
        allow(subject).to receive(:application_routes) { anything }
        allow(subject).to receive(:engine_routes) { anything }
        allow(subject).to receive(:mount_routes) { anything }
        subject.routes
      end

      it 'sets @routes' do
        expect(subject.instance_variable_get(:@routes)).to_not be_nil
      end

      it 'sets @engine_routes' do
        expect(subject.instance_variable_get(:@engine_routes)).to_not be_nil
      end

      it 'sets @mount_routes' do
        expect(subject.instance_variable_get(:@mount_routes)).to_not be_nil
      end
    end
  end
end
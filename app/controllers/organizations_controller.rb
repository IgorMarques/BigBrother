class OrganizationsController < ApplicationController

  def index
    @orgs = @client.organizations
  end
end

class OrganizationsController < ApplicationController

  def index
    @orgs = @client.organizations
  end

  def pull_requests
    @org = params[:id]
  end
end

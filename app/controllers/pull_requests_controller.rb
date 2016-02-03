class PullRequestsController < ApplicationController

  def index
    @orgs = client.organizations
  end
end

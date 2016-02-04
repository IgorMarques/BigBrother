class OrganizationsController < ApplicationController

  def index
    @orgs = @client.organizations
  end

  def pull_requests
    @org = params[:id]

    # THIS IS ONLY GETTING PUBLIC REPOS
    @repos = @client.repos(@org).map{|x| x[:name]}

    #@client.repos is able to get even private repos
  end
end

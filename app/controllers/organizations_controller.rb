class OrganizationsController < ApplicationController

  def index
    @orgs = @client.organizations
  end

  def pull_requests
    @org = params[:id]

    # THIS IS ONLY GETTING PUBLIC REPOS
    @repos = @client.repos(@org).map do |r|
      {
        name: r[:name],
        pull_requests: get_pull_requests( r[:name])
      }
    end

    #@client.repos is able to get even private repos

    @repos << {name: "Hiroshima", pull_requests: get_pull_requests("Hiroshima")}

    # raise Exception.new @bonus
  end

  private

  def get_pull_requests(repo)
    @client.pull_requests("#{@org}/#{repo}")
    .map do |pr|
      build_pr(pr)
    end
  end

  def build_pr(pull_request)
    pull_request.to_hash.slice(:number, :html_url, :title)
  end
end

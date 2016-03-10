class OrganizationsController < ApplicationController

  def index
    @orgs = @client.organizations
  end

  def pull_requests
    @org = params[:id]

    @repos = @client.org_repos(@org).map do |repo|
      {
        name: repo[:name],
        pull_requests: get_pull_requests(repo[:name]),
        pull_requests_url: get_pull_requests_url(repo[:name])
      }
    end
  end

  private

  def get_pull_requests(repo)
    @client.pull_requests("#{@org}/#{repo}")
    .map do |pr|
      build_pr(pr)
    end
  end

  def build_pr(pull_request)
    pull_request = pull_request.to_hash.slice(:number, :html_url, :title, :user)
    pull_request[:user] = pull_request[:user].to_hash
    pull_request
  end

  def get_pull_requests_url(repo)
    "https://github.com/#{@org}/#{repo}/pulls"
  end
end

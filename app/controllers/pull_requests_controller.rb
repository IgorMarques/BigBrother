class PullRequestsController < ApplicationController

  def index
    client = Octokit::Client.new(:access_token => current_user["token"])

    Octokit.auto_paginate = true

    @orgs = client.organizations

    # raise Exception.new @repos.first.login
  end
end

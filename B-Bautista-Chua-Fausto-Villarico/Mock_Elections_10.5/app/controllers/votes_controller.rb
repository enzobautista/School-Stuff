class VotesController < ApplicationController
  before_action :authenticate_user!


  def show
    @vote = Vote.find(params[:id])

    render 'votes/show'
  end

  def new

    @vote = Vote.new
    @candidate = Candidate.find(params[:candidate_id])
    #This verifies if the user has voted for a single candidate
      if Vote.exists?(candidate_id: @candidate.id, user_id: current_user.id)
      redirect_to position_path(@candidate.position.id)
    else
    render 'votes/new'
    end

  end

  def create

    @vote = Vote.new(vote_params)
    @candidate = Candidate.find(params[:candidate_id])
    @vote.candidate = @candidate
    @vote.user = current_user

    if @vote.save
      redirect_to positions_path
    else
      render "votes/new"
    end

  end

  def edit
    @vote = Vote.find(params[:id])
    @candidate = Candidate.find(params[:candidate_id])

    render "votes/edit"
  end

  def update
    @vote = Vote.find(params[:id])

    if @vote.update(vote_params)
      redirect_to root_path
    else
      render "vote/edit"
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy!
    redirect_to root_path
  end

  def vote_params
    params.require(:vote).permit!
  end

end

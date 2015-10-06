class PositionsController < ApplicationController

  def index
    @positions = Position.all

    render "positions/index"
  end

  def show
    @position = Position.find(params[:id])

    ###########################################################################
    #Checks is current user has voted for one in the ENTIRE candidate list
    if user_signed_in?
     votecounter = 0
     current_user.votes.each do |v|
        @position.candidates.each do |candidate|
         candidate.votes.each do |v2|
          if v2.id == v.id
           votecounter +=1
          end #ends if
         end #ends 3rd loop
       end #ends 2nd loop
     end #ends 1st loop
    end
    @votecounter = votecounter
    ###########################################################################

    render 'positions/show'
  end

  def new

      @position = Position.new
      render 'positions/new'

  end

  def create

    @position = Position.new(position_params)


    if @position.save
      redirect_to root_path
    else
      render "positions/new"
    end

  end

  def edit

    @position = Position.find(params[:id])

    render "positions/edit"
  end

  def update

    @position = Position.find(params[:id])

    if @position.update(position_params)
      redirect_to root_path
    else
      render "position/edit"
    end
  end

  def destroy

    position = Position.find(params[:id])
    position.destroy!
    redirect_to root_path
  end

  def position_params
    params.require(:position).permit!
  end

end

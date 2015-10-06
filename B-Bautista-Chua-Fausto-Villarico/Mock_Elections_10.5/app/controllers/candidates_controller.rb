class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
    render "candidates/index"
  end

  def show
    @candidate = Candidate.find(params[:id])

    ####################################################################################
    #to count votes from genders
    malecounter = 0
    femalecounter = 0
    othercounter = 0
    nocounter = 0
    @candidate.votes.each do |x|
      if x.user.gender == "Male"
        malecounter += 1
      elsif x.user.gender == "Female"
        femalecounter += 1
      elsif x.user.gender =="Other"
        othercounter +=1
      else x.user.gender == "" || x.user.gender == nil
       nocounter += 1
      end
    end
    @malecounter = malecounter #counts men
    @femalecounter = femalecounter #counts females
    @othercounter = othercounter #counts other gender
    @nocounter = nocounter #counts genderless (did not register in db, please edit again)
    #####################################################################################

    render 'candidates/show'
  end

  def new
    @candidate = Candidate.new
    render 'candidates/new'
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to root_path
    else
      render "candidates/new"
    end

  end

  def edit
    @candidate = Candidate.find(params[:id])

    render "candidates/edit"
  end

  def update
    @candidate = Candidate.find(params[:id])

    if @candidate.update(candidate_params)
      redirect_to root_path
    else
      render "candidate/edit"
    end
  end

  def destroy
    candidate = Candidate.find(params[:id])
    candidate.destroy!
    redirect_to root_path
  end

  def candidate_params
    params.require(:candidate).permit!
  end

end

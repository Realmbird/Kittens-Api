class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kiten_params)
    if @kitten.save
      flash[:notice] = "Kitten successfully created"
      redirect_to @kitten
    else
      flash[:notice] = "Kitten failed to be created" 
      render 'new'
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    #if @kitten.update(kiten_params)
    if @kitten.update(kiten_params)
      flash[:notice] = "Kitten successfully updated"
      redirect_to @kitten
    else 
      flash[:notice] = "Kitten failed to be updated"
      render 'edit'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = "Kitten successfully destroyed"
    redirect_to kittens_path
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kitten}
    end
  end

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kittens }
    end
  end

  private 
  def kiten_params
    params.require(:kitten).permit(:id, :name, :age, :cuteness, :softness)
  end
end

class NamesController < ApplicationController
def new
  @name = Name.new
end  
def index
	@names = Name.all
end
def show
end
def create
   @name = Name.new(name_params)
if @name.save
  redirect_to :action => 'new'
else
  render :action => 'new'
end
end
def results
end
    def name_params
      params.require(:name).permit(:input, :gifttext)
    end
end
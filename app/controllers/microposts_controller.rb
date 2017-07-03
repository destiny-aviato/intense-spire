class MicropostsController < ApplicationController

    def index
        @microposts = Micropost.all.paginate(page: params[:page], per_page: 10)
        @micropost = current_user.microposts.build 
    end

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Post created!"
            redirect_to microposts_path
        else
         render microposts_path
        end
    end

    def destroy
    end

    private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
end
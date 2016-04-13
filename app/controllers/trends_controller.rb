class TrendsController < ApplicationController
    before_action :signed_in_user,  only: [:create, :destroy, :show]

    def index
        @trends = @micropost.trends.order('id')
    end

    def new
        @trend = @micropost.trends.new
    end

      def create
        @micropost = Micropost.find(params[:micropost_id])
        @trend = Trend.new(params[:trend].permit(:user_id, :trend_id, :peer, :micropost_id))
        @trend.micropost = @micropost
        @trend.micropost.user = @micropost.user
        @trend.user = current_user
        @trend.save
        current_user
        respond_to do |format|
          format.html {redirect_to @micropost}
          format.js
      end
    end
    
     def destroy
        @trend = Trend.find(params[:id])
        @trend.destroy 
        respond_to do |format|
        format.html { redirect_to @trend.micropost }
        format.js 
   end
  end
  
    private
    def trend_params
        params.require(:trend).permit(:peer, :user_id, :trend_id, :micropost_id)
    end
    
    def set_trend
      @trend = Trend.find(params[:id])
    end

end


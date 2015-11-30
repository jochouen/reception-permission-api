class ReceptionPermissionController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def getReceptionFlag
    @users = User.find_by user_identifier: params[:user_identifier]
    # p @users
    # render "index", :formats => [:json], :handlers => [:jbuilder]
  end

  def setReceptionFlag
    @params = JSON.parse(request.body.read)

    p @params['reception_flag']
    # @params = JSON.parse request.body.read

    # p @params
    # p object
    if User.update_all(user_params)
      @result = {status: 'OK'}
    else
      @result = {status: 'NG'}
    end
  end

  def user_params
    params.require(:params).permit(:user_identifier, :reception_flag)
  end
end

class Mypage::AvatarsController < Mypage::ApplicationController
  def edit; end

  def update
    if current_user.update(avatar_params)
      redirect_to mypage_root_path, notice: 'avatarを保存しました'
    else
      render :edit
    end
  end

  private def avatar_params
    params.require(:user).permit(:image)
  end
end

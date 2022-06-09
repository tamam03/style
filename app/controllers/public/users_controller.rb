class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @item = @user.items
    
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    # ログインユーザーとメッセージ相手のユーザーをEntryから検索，取得
    
    unless @user.id == current_user.id
      # showのuserがログインユーザーじゃないとき
      @current_entry.each do |current|
        @another_entry.each do |another|
          # 取得したユーザー情報にひもづくEntyをeachでまわす
          # ログインユーザーのEntryと@userのEntryを１つづつとりだし
          # ログインユーザーのEntryはcurrent
          # @userのEntryはanother
          if current.room_id == another.room_id
            # Entryのなかのroom_idが合致した場合
            @is_room = true
                                                                        # (？)
            @room_id = current.room_id
            # ログインユーザーのEntryのroom_id = @room_id
          end
        end
      end
      unless @is_room                                                          # (？)
        @room = Room.new
        @entry = Entry.new
      end
    end
  end




  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user), notice: "保存しました"
    else
      render "edit"
    end
  end

  def favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)
    @favorite_lists = Item.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :name_kana, :nick_name, :brand_id, :store_id, :is_user, :profile_image)
  end
end


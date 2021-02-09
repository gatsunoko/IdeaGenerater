module UserIdentify
  def is_admin
    if current_user.role != 'admin'
      redirect_to root_path and return
    end
  end
  #editorかadminである
  def editor_above
    if current_user.role != 'editor' && current_user.role != 'admin'
      redirect_to root_path and return
    end
  end

  def can_edit
    if @article.user_id != current_user.id &&
    current_user.role != 'editor' &&
    current_user.role != 'admin'
      redirect_to root_path and return
    end
  end

  def unless_user
    if current_user.role == 'user'
      redirect_to root_path and return
    end
  end

  #ユーザー情報を登録していなかったら登録ページに遷移する
  def personal_information_present
    if current_user.personal_information.blank?
      redirect_to edit_user_path(current_user.id) and return
    end
  end
end
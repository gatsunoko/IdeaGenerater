class User < ApplicationRecord
  after_create :first_user
  after_create :name_check

  has_many :ideas, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable,
          :rememberable, :validatable, :omniauthable, :timeoutable, :confirmable
  # user          投稿できない
  # author        投稿はできる、自分の投稿のみ編集可能
  # editor        投稿できる他人の投稿も編集もできる
  # admin         ユーザー権限を設定できる
  enum role: { user: 1, author: 2, editor: 4, admin: 5 }
  validates :name, length: { maximum: 50 }

  def self.find_for_google(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(provider: auth.provider,
                         email:    User.dummy_email(auth),
                         image:    auth.info.image,
                         uid:      auth.uid,
                         token:    auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         name: auth.info.name,
                         role: :user,
                         confirmed_at: Date.today)
    end
    user
  end

  private
    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@omniauthable.com"
    end

    def first_user
      if User.all.count == 1
        self.update(role: 5)
      end
    end

    def name_check
      if self.name.blank?
        self.update(name: self.email)
      end
    end
end

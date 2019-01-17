class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable, :timeoutable, :trackable
    :jwt_authenticatable, jwt_revocation_strategy: JWTBlacklist

  def jwt_payload
    { 'foo' => 'bar' }
  end
end

class Payment < ApplicationRecord
  belongs_to :order
  # validates :card_number, format: { with: ^(?:4[0-9]{12}(?:[0-9]{3})? ,
  #     message: "only allows no" }
  belongs_to :user
  validates :card_number, presence: true, length: { maximum: 16, too_long: "%{count} number is the maximum allowed" }
  validates :cvc, presence: true, length: { maximum: 4, too_long: "%{count} number is the maximum allowed" }

  after_commit :send_order_confirmation_email

  private
  def send_order_confirmation_email
    UserMailer.order_confirmation(self.user).deliver
  end
end
  
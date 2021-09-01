class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :allergy, :blood_type, :chronic_condition, :venue

  has_one :register

  with_options presence: true do
    validates :address, :datetime, :public_uid
    validates :name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :name_reading, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :phone_number,format: {with: /\A\d{10,11}\z/}
    validates :body_weight, :height, format: {with: /\A[0-9]+\z/}
    validates :body_temperature, format: {with: /\A\d{1,2}(\.\d)?\z/}
    validates :blood_type_id, :allergy_id, :chronic_condition_id, :venue_id, numericality: { other_than: 1, message: "を選択してください"} 
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  def assign_public_uid
      self.public_uid =  SecureRandom.alphanumeric(5)
  end

end
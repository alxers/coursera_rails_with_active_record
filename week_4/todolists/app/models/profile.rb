class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_or_last_name_presence
  validates :gender, inclusion: { in: %w( male female ) }
  validate :correct_name

  def first_or_last_name_presence
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, 'at least first or last name should be present')
      errors.add(:last_name, 'at least first or last name should be present')
    end
  end

  def correct_name
    if gender == 'male' && first_name == 'Sue'
      errors.add(:first_name, 'is not allowed')
    end
  end

  def self.get_all_profiles(min, max)
    where("birth_year BETWEEN :min and :max", min: min, max: max).order("birth_year ASC")
  end
end

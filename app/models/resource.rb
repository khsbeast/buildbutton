class Resource < ApplicationRecord
  belongs_to :category
  before_save :validate_glossary_letter

  def validate_glossary_letter
    if self.glossary_letter.present?
      if self.glossary_letter.length > 1
        errors.add(:glossary_letter_incorrect, "Glossary letter should be a single character.")
        raise ActiveRecord::RecordInvalid.new(self)
      end
      self.glossary_letter = self.glossary_letter.upcase
    end
  end
end

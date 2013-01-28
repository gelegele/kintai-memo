class TimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.attributes[options[:less_than]] <= value
      record.errors.add(attribute, " must be less than #{options[:less_than]}")
    end
  end
end

module ActsAsSimpleTranslatable
  module ClassMethods
    def acts_as_simple_translatable_on(*fields)
      # scope :with_translations, -> (locale) { joins(:translations).where(translations: {locale: locale}).preload(:translations) }
      scope :with_translations, -> { includes(:translations) }
      has_many :translations, as: :translatable, dependent: :destroy
      accepts_nested_attributes_for :translations, reject_if: :all_blank, allow_destroy: :true

      @locale_fields = fields
      class << self
        attr_accessor :locale_fields
      end

      # Loop through fields to define methods such as "name" and "description"
      fields.each do |field|
        define_method "#{field}" do
          content = (I18n.locale == I18n.default_locale) ? super() : locale_translations[field]
          content.present? ? content : super
        end

        define_method "#{field}_original" do
          self[field]
        end

        define_method "#{field}?" do
          !send("#{field}").blank?
        end
      end

      define_method :locale_translations do
        # load translations
        unless @locale_translations
          @locale_translations = {}
          translations.select { |t| t.locale == I18n.locale.to_s }.each do |translation|
            @locale_translations ||= {}
            @locale_translations[translation.translatable_field.to_sym] = translation.content
          end
        end
        @locale_translations
      end
    end
  end
end

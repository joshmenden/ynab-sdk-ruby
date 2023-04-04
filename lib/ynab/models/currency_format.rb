=begin
#YNAB API Endpoints

#Our API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body.  API Documentation is at https://api.ynab.com

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.14

=end

require 'date'

module YNAB
  # The currency format setting for the budget.  In some cases the format will not be available and will be specified as null.
  class CurrencyFormat
    attr_accessor :iso_code

    attr_accessor :example_format

    attr_accessor :decimal_digits

    attr_accessor :decimal_separator

    attr_accessor :symbol_first

    attr_accessor :group_separator

    attr_accessor :currency_symbol

    attr_accessor :display_symbol

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'iso_code' => :'iso_code',
        :'example_format' => :'example_format',
        :'decimal_digits' => :'decimal_digits',
        :'decimal_separator' => :'decimal_separator',
        :'symbol_first' => :'symbol_first',
        :'group_separator' => :'group_separator',
        :'currency_symbol' => :'currency_symbol',
        :'display_symbol' => :'display_symbol'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'iso_code' => :'String',
        :'example_format' => :'String',
        :'decimal_digits' => :'Integer',
        :'decimal_separator' => :'String',
        :'symbol_first' => :'BOOLEAN',
        :'group_separator' => :'String',
        :'currency_symbol' => :'String',
        :'display_symbol' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'iso_code')
        self.iso_code = attributes[:'iso_code']
      end

      if attributes.has_key?(:'example_format')
        self.example_format = attributes[:'example_format']
      end

      if attributes.has_key?(:'decimal_digits')
        self.decimal_digits = attributes[:'decimal_digits']
      end

      if attributes.has_key?(:'decimal_separator')
        self.decimal_separator = attributes[:'decimal_separator']
      end

      if attributes.has_key?(:'symbol_first')
        self.symbol_first = attributes[:'symbol_first']
      end

      if attributes.has_key?(:'group_separator')
        self.group_separator = attributes[:'group_separator']
      end

      if attributes.has_key?(:'currency_symbol')
        self.currency_symbol = attributes[:'currency_symbol']
      end

      if attributes.has_key?(:'display_symbol')
        self.display_symbol = attributes[:'display_symbol']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @iso_code.nil?
        invalid_properties.push('invalid value for "iso_code", iso_code cannot be nil.')
      end

      if @example_format.nil?
        invalid_properties.push('invalid value for "example_format", example_format cannot be nil.')
      end

      if @decimal_digits.nil?
        invalid_properties.push('invalid value for "decimal_digits", decimal_digits cannot be nil.')
      end

      if @decimal_separator.nil?
        invalid_properties.push('invalid value for "decimal_separator", decimal_separator cannot be nil.')
      end

      if @symbol_first.nil?
        invalid_properties.push('invalid value for "symbol_first", symbol_first cannot be nil.')
      end

      if @group_separator.nil?
        invalid_properties.push('invalid value for "group_separator", group_separator cannot be nil.')
      end

      if @currency_symbol.nil?
        invalid_properties.push('invalid value for "currency_symbol", currency_symbol cannot be nil.')
      end

      if @display_symbol.nil?
        invalid_properties.push('invalid value for "display_symbol", display_symbol cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @iso_code.nil?
      return false if @example_format.nil?
      return false if @decimal_digits.nil?
      return false if @decimal_separator.nil?
      return false if @symbol_first.nil?
      return false if @group_separator.nil?
      return false if @currency_symbol.nil?
      return false if @display_symbol.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          iso_code == o.iso_code &&
          example_format == o.example_format &&
          decimal_digits == o.decimal_digits &&
          decimal_separator == o.decimal_separator &&
          symbol_first == o.symbol_first &&
          group_separator == o.group_separator &&
          currency_symbol == o.currency_symbol &&
          display_symbol == o.display_symbol
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [iso_code, example_format, decimal_digits, decimal_separator, symbol_first, group_separator, currency_symbol, display_symbol].hash
    end
    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = YNAB.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end

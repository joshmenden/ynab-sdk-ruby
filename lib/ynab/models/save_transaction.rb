=begin
#YNAB API Endpoints

#Our API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body.  API Documentation is at https://api.youneedabudget.com

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.14

=end

require 'date'

module YNAB
  class SaveTransaction
    attr_accessor :account_id

    # The transaction date in ISO format (e.g. 2016-12-01).  Future dates (scheduled transactions) are not permitted.  Split transaction dates cannot be changed and if a different date is supplied it will be ignored.
    attr_accessor :date

    # The transaction amount in milliunits format.  Split transaction amounts cannot be changed and if a different amount is supplied it will be ignored.
    attr_accessor :amount

    # The payee for the transaction.  To create a transfer between two accounts, use the account transfer payee pointing to the target account.  Account transfer payees are specified as `tranfer_payee_id` on the account resource.
    attr_accessor :payee_id

    # The payee name.  If a `payee_name` value is provided and `payee_id` has a null value, the `payee_name` value will be used to resolve the payee by either (1) a matching payee rename rule (only if `import_id` is also specified) or (2) a payee with the same name or (3) creation of a new payee.
    attr_accessor :payee_name

    # The category for the transaction.  To configure a split transaction, you can specify null for `category_id` and provide a `subtransactions` array as part of the transaction object.  If an existing transaction is a split, the `category_id` cannot be changed.  Credit Card Payment categories are not permitted and will be ignored if supplied.
    attr_accessor :category_id

    attr_accessor :memo

    # The cleared status of the transaction
    attr_accessor :cleared

    # Whether or not the transaction is approved.  If not supplied, transaction will be unapproved by default.
    attr_accessor :approved

    # The transaction flag
    attr_accessor :flag_color

    # If specified, the new transaction will be assigned this `import_id` and considered \"imported\".  We will also attempt to match this imported transaction to an existing \"user-entered\" transation on the same account, with the same amount, and with a date +/-10 days from the imported transaction date.<br><br>Transactions imported through File Based Import or Direct Import (not through the API) are assigned an import_id in the format: 'YNAB:[milliunit_amount]:[iso_date]:[occurrence]'. For example, a transaction dated 2015-12-30 in the amount of -$294.23 USD would have an import_id of 'YNAB:-294230:2015-12-30:1'.  If a second transaction on the same account was imported and had the same date and same amount, its import_id would be 'YNAB:-294230:2015-12-30:2'.  Using a consistent format will prevent duplicates through Direct Import and File Based Import.<br><br>If import_id is omitted or specified as null, the transaction will be treated as a \"user-entered\" transaction. As such, it will be eligible to be matched against transactions later being imported (via DI, FBI, or API).
    attr_accessor :import_id

    # An array of subtransactions to configure a transaction as a split.  Updating `subtransactions` on an existing split transaction is not supported.
    attr_accessor :subtransactions

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_id' => :'account_id',
        :'date' => :'date',
        :'amount' => :'amount',
        :'payee_id' => :'payee_id',
        :'payee_name' => :'payee_name',
        :'category_id' => :'category_id',
        :'memo' => :'memo',
        :'cleared' => :'cleared',
        :'approved' => :'approved',
        :'flag_color' => :'flag_color',
        :'import_id' => :'import_id',
        :'subtransactions' => :'subtransactions'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'account_id' => :'String',
        :'date' => :'Date',
        :'amount' => :'Integer',
        :'payee_id' => :'String',
        :'payee_name' => :'String',
        :'category_id' => :'String',
        :'memo' => :'String',
        :'cleared' => :'String',
        :'approved' => :'BOOLEAN',
        :'flag_color' => :'String',
        :'import_id' => :'String',
        :'subtransactions' => :'Array<SaveSubTransaction>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.has_key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'payee_id')
        self.payee_id = attributes[:'payee_id']
      end

      if attributes.has_key?(:'payee_name')
        self.payee_name = attributes[:'payee_name']
      end

      if attributes.has_key?(:'category_id')
        self.category_id = attributes[:'category_id']
      end

      if attributes.has_key?(:'memo')
        self.memo = attributes[:'memo']
      end

      if attributes.has_key?(:'cleared')
        self.cleared = attributes[:'cleared']
      end

      if attributes.has_key?(:'approved')
        self.approved = attributes[:'approved']
      end

      if attributes.has_key?(:'flag_color')
        self.flag_color = attributes[:'flag_color']
      end

      if attributes.has_key?(:'import_id')
        self.import_id = attributes[:'import_id']
      end

      if attributes.has_key?(:'subtransactions')
        if (value = attributes[:'subtransactions']).is_a?(Array)
          self.subtransactions = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @account_id.nil?
        invalid_properties.push('invalid value for "account_id", account_id cannot be nil.')
      end

      if @date.nil?
        invalid_properties.push('invalid value for "date", date cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if !@payee_name.nil? && @payee_name.to_s.length > 50
        invalid_properties.push('invalid value for "payee_name", the character length must be smaller than or equal to 50.')
      end

      if !@memo.nil? && @memo.to_s.length > 200
        invalid_properties.push('invalid value for "memo", the character length must be smaller than or equal to 200.')
      end

      if !@import_id.nil? && @import_id.to_s.length > 36
        invalid_properties.push('invalid value for "import_id", the character length must be smaller than or equal to 36.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @account_id.nil?
      return false if @date.nil?
      return false if @amount.nil?
      return false if !@payee_name.nil? && @payee_name.to_s.length > 50
      return false if !@memo.nil? && @memo.to_s.length > 200
      cleared_validator = EnumAttributeValidator.new('String', ['cleared', 'uncleared', 'reconciled'])
      return false unless cleared_validator.valid?(@cleared)
      flag_color_validator = EnumAttributeValidator.new('String', ['red', 'orange', 'yellow', 'green', 'blue', 'purple'])
      return false unless flag_color_validator.valid?(@flag_color)
      return false if !@import_id.nil? && @import_id.to_s.length > 36
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] payee_name Value to be assigned
    def payee_name=(payee_name)
      if !payee_name.nil? && payee_name.to_s.length > 50
        fail ArgumentError, 'invalid value for "payee_name", the character length must be smaller than or equal to 50.'
      end

      @payee_name = payee_name
    end

    # Custom attribute writer method with validation
    # @param [Object] memo Value to be assigned
    def memo=(memo)
      if !memo.nil? && memo.to_s.length > 200
        fail ArgumentError, 'invalid value for "memo", the character length must be smaller than or equal to 200.'
      end

      @memo = memo
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] cleared Object to be assigned
    def cleared=(cleared)
      @cleared = cleared
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] flag_color Object to be assigned
    def flag_color=(flag_color)
      @flag_color = flag_color
    end

    # Custom attribute writer method with validation
    # @param [Object] import_id Value to be assigned
    def import_id=(import_id)
      if !import_id.nil? && import_id.to_s.length > 36
        fail ArgumentError, 'invalid value for "import_id", the character length must be smaller than or equal to 36.'
      end

      @import_id = import_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          date == o.date &&
          amount == o.amount &&
          payee_id == o.payee_id &&
          payee_name == o.payee_name &&
          category_id == o.category_id &&
          memo == o.memo &&
          cleared == o.cleared &&
          approved == o.approved &&
          flag_color == o.flag_color &&
          import_id == o.import_id &&
          subtransactions == o.subtransactions
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [account_id, date, amount, payee_id, payee_name, category_id, memo, cleared, approved, flag_color, import_id, subtransactions].hash
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

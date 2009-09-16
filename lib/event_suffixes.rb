module EventSuffixes
  module ClassMethods
    def use_aura_dose_suffix
      self.map_boolean_column :buff, :suffix1
      self.map_column :amount, :suffix2
      
      define_method "process_suffix" do |factory, line|
        self.buff   = ( line.shift == "BUFF" )        
        self.amount = line.shift.to_i
      end
      
      define_method "suffix" do
        "AURA_DOSE"
      end
    end
    
    def use_aura_suffix
      self.map_boolean_column :buff, :suffix1
      
      define_method "process_suffix" do |factory, line|
        self.buff   = ( line.shift == "BUFF" )        
      end
      
      define_method "suffix" do
        "AURA"
      end
    end

    def use_damage_suffix
      self.map_column :amount, :suffix1
      self.map_column :overkill, :suffix2
      self.map_column :school, :suffix3
      self.map_column :resisted, :suffix4
      self.map_column :blocked, :suffix5
      self.map_column :absorbed, :suffix6
      
      self.map_boolean_column :critical, :suffix7
      self.map_boolean_column :glancing, :suffix8
      self.map_boolean_column :crushing, :suffix9
      
      define_method "process_suffix" do |factory, line|
        self.amount   = line.shift.to_i
        self.overkill = line.shift.to_i
        self.school   = line.shift.to_i
        self.resisted = line.shift.to_i
        self.blocked  = line.shift.to_i
        self.absorbed = line.shift.to_i
        
        self.critical = ( line.shift == "1" )
        self.glancing = ( line.shift == "1" )
        self.crushing = ( line.shift == "1" )
      end
      
      define_method "suffix" do
        "DAMAGE"
      end
    end
    
    def use_dispel_suffix
      self.belongs_to :extra_spell, :class_name => "Spell", :foreign_key => "suffix1"
      self.map_boolean_column :buff, :suffix2

      define_method "process_suffix" do |factory, line|
        spell_id     = line.shift.to_i
        spell_name   = line.shift
        spell_school = line.shift.to_i
        
        self.extra_spell = factory.spell( spell_id, spell_name, spell_school )
        
        self.buff = ( line.shift == "BUFF" )        
      end
      
      define_method "suffix" do
        "DISPEL"
      end
    end
    
    def use_drain_suffix
      self.map_column :amount, :suffix1
      self.map_column :power_type, :suffix2
      self.map_column :extra_amount, :suffix3
      
      define_method "process_suffix" do |factory, line|
        self.amount       = line.shift.to_i
        self.power_type   = line.shift.to_i
        self.extra_amount = line.shift.to_i
      end
      
      define_method "suffix" do
        "DRAIN"
      end
    end
    
    def use_energize_suffix
      self.map_column :amount, :suffix1
      self.map_column :power_type, :suffix2
      
      define_method "process_suffix" do |factory, line|
        self.amount     = line.shift.to_i
        self.power_type = line.shift.to_i
      end
      
      define_method "suffix" do
        "ENERGIZE"
      end
    end
    
    def use_extra_attacks_suffix
      self.map_column :amount, :suffix1
      
      define_method "process_suffix" do |factory, line|
        self.amount     = line.shift.to_i
      end
      
      define_method "suffix" do
        "EXTRA_ATTACKS"
      end
    end
    
    def use_fail_suffix
      self.belongs_to :fail_type, :class_name => "FailType", :foreign_key => "suffix1"
      
      define_method "process_suffix" do |factory, line|
        fail_type_name = line.shift
        
        self.fail_type = factory.fail_type( fail_type_name )
      end
      
      define_method "suffix" do
        "FAIL"
      end
    end    
    
    def use_heal_suffix
      self.map_column :amount, :suffix1
      self.map_column :overheal, :suffix2
      self.map_column :absorbed, :suffix3
      
      self.map_boolean_column :critical, :suffix4
      
      define_method "process_suffix" do |factory, line|
        self.amount   = line.shift.to_i
        self.overheal = line.shift.to_i
        
        # Fix for the event arguments change in 3.2
        if line.length > 1
          self.absorbed = line.shift.to_i
        else
          self.absorbed = 0
        end
        
        self.critical = ( line.shift == "1" )
      end
      
      define_method "suffix" do
        "HEAL"
      end
    end

    def use_interrupt_suffix
      self.belongs_to :extra_spell, :class_name => "Spell", :foreign_key => "suffix1"

      define_method "process_suffix" do |factory, line|
        spell_id     = line.shift.to_i
        spell_name   = line.shift
        spell_school = line.shift.to_i
        
        self.extra_spell = factory.spell( spell_id, spell_name, spell_school )
      end
      
      define_method "suffix" do
        "INTERRUPT"
      end
    end
    
    def use_miss_suffix
      self.belongs_to :miss_type, :class_name => "MissType", :foreign_key => "suffix1"
      
      self.map_column :amount, :suffix2
      
      define_method "process_suffix" do |factory, line|
        miss_type_name = line.shift

        self.miss_type = factory.miss_type( miss_type_name )

        self.amount = line.shift.to_i        
      end
      
      define_method "suffix" do
        "MISS"
      end
    end
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
  end
end
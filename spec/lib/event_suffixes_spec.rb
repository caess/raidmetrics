require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EventSuffixes do
  context "use_aura_dose_suffix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :map_boolean_column ).with( :buff, :suffix1 )
        self.should_receive( :map_column ).with( :amount, :suffix2 )
        
        use_aura_dose_suffix
      end
    end
    
    it "should set the suffix as AURA_DOSE" do
      event = Event.new
      
      class << event
        use_aura_dose_suffix
      end
      
      event.suffix.should == "AURA_DOSE"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_aura_dose_suffix
        end
        
        @values = [ "BUFF", "112" ]
      end
      
      it "should set buff? to be true if the first field is 'BUFF'" do
        @values.first = "BUFF"
        @event.process_suffix( nil, @values.clone )
      
        @event.buff?.should be_true
      end
    
      it "should set buff? to be false if the first field is 'DEBUFF'" do
        @values.first = "DEBUFF"
        @event.process_suffix( nil, @values.clone )
      
        @event.buff?.should_not be_true
      end
    
      it "should set amount to the value of the second field" do
        @event.process_suffix( nil, @values.clone )
      
        @event.amount.should == @values.second.to_i
      end
    end
  end

  context "use_aura_suffix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :map_boolean_column ).with( :buff, :suffix1 )
        
        use_aura_suffix
      end
    end
    
    it "should set the suffix as AURA" do
      event = Event.new
      
      class << event
        use_aura_suffix
      end
      
      event.suffix.should == "AURA"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
      
        class << @event
          use_aura_suffix
        end
      end
      
      it "should set buff? to be true if the first field is 'BUFF'" do      
        @event.process_suffix( nil, [ "BUFF" ] )
      
        @event.buff?.should be_true
      end
    
      it "should set buff? to be false if the first field is 'DEBUFF'" do
        @event.process_suffix( nil, [ "DEBUFF" ] )
      
        @event.buff?.should_not be_true
      end
    end
  end

  context "use_damage_suffix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :map_column ).with( :amount, :suffix1 )
        self.should_receive( :map_column ).with( :overkill, :suffix2 )
        self.should_receive( :map_column ).with( :school, :suffix3 )
        self.should_receive( :map_column ).with( :resisted, :suffix4 )
        self.should_receive( :map_column ).with( :blocked, :suffix5 )
        self.should_receive( :map_column ).with( :absorbed, :suffix6 )
        self.should_receive( :map_boolean_column ).with( :critical, :suffix7 )
        self.should_receive( :map_boolean_column ).with( :glancing, :suffix8 )
        self.should_receive( :map_boolean_column ).with( :crushing, :suffix9 )
        
        use_damage_suffix
      end
    end
    
    it "should set the suffix as DAMAGE" do
      event = Event.new
      
      class << event
        use_damage_suffix
      end
      
      event.suffix.should == "DAMAGE"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_damage_suffix
        end
        
        @values = [ "111", "112", "113", "114", "115", "116", "nil", "nil", "nil" ]
      end
      
      it "should set damage to the value in the first field" do
        @event.process_suffix( nil, @values.clone )
        
        @event.amount.should == @values.first.to_i
      end
      
      it "should set overkill to the value in the second field" do
        @event.process_suffix( nil, @values.clone )
        
        @event.overkill.should == @values.second.to_i
      end
      
      it "should set school to the value in the third field" do
        @event.process_suffix( nil, @values.clone )
        
        @event.school.should == @values.third.to_i
      end
      
      it "should set resisted to the value in the fourth field" do
        @event.process_suffix( nil, @values.clone )
        
        @event.resisted.should == @values.fourth.to_i
      end
      
      it "should set blocked to the value in the fifth field" do
        @event.process_suffix( nil, @values.clone )
        
        @event.blocked.should == @values.fifth.to_i
      end
      
      it "should set absorbed to the value in the sixth field" do
        @event.process_suffix( nil, @values.clone )
        
        @event.absorbed.should == @values.sixth.to_i
      end
      
      it "should set critical to true if the seventh field is '1'" do
        @values.seventh = "1"
        @event.process_suffix( nil, @values.clone )
        
        @event.critical?.should be_true
      end
      
      it "should set critical to false if the seventh field is 'nil'" do
        @values.seventh = "nil"
        @event.process_suffix( nil, @values.clone )
        
        @event.critical?.should_not be_true
      end
      
      it "should set glancing to true if the eighth field is '1'" do
        @values.eighth = "1"
        @event.process_suffix( nil, @values.clone )
        
        @event.glancing?.should be_true
      end
      
      it "should set glancing to false if the eighth field is 'nil" do
        @values.eighth = "nil"
        @event.process_suffix( nil, @values.clone )
        
        @event.glancing?.should_not be_true
      end
      
      it "should set crushing to true if the ninth field is '1'" do
        @values.ninth = "1"
        @event.process_suffix( nil, @values.clone )
        
        @event.crushing?.should be_true
      end
      
      it "should set crushing to false if the ninth field is 'nil'" do
        @values.ninth = "nil"
        @event.process_suffix( nil, @values.clone )
        
        @event.crushing?.should_not be_true
      end
    end
  end
  
  context "use_dispel_suffix" do
    it "should map columns" do
      event = Event.new

      class << event
        self.should_receive( :belongs_to ).with( :extra_spell, :class_name => "Spell", :foreign_key => "suffix1" )
        self.should_receive( :map_boolean_column ).with( :buff, :suffix2 )

        use_dispel_suffix
      end
    end

    it "should set the suffix as DISPEL" do
      event = Event.new

      class << event
        use_dispel_suffix
      end

      event.suffix.should == "DISPEL"
    end
    
    context "#process" do
      before(:each) do
        @event = Event.new
        
        class << @event
          use_dispel_suffix
        end
        
        @values = [ "64157", "Curse of Doom", "32", "DEBUFF" ]
        
        @spell = Spell.create!( :name => "Curse of Doom", :spell_id => 64157, :school => 32 )
      end
      
      it "should map the first three fields to a spell" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :spell ).with( @values.first.to_i, @values.second, @values.third.to_i ).and_return( @spell )
        
        @event.process( factory, @values.clone )
        
        @event.extra_spell.should == @spell
        @event.suffix1.should == @spell.id
      end
      
      it "should set buff to true if the fourth field is 'BUFF'" do
        factory = mock( "EventFactory" )
        factory.should_receive( :spell ).and_return( @spell )
        
        @values.fourth = "BUFF"
        @event.process( factory, @values.clone )
        
        @event.buff?.should be_true
      end
      
      it "should set buff to false if the fourth field is 'DEBUFF'" do
        factory = mock( "EventFactory" )
        factory.should_receive( :spell ).and_return( @spell )
        
        @values.fourth = "DEBUFF"
        @event.process( factory, @values.clone )
        
        @event.buff?.should_not be_true
      end
    end
  end
  
  context "use_drain_suffix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :map_column ).with( :amount, :suffix1 )
        self.should_receive( :map_column ).with( :power_type, :suffix2 )
        self.should_receive( :map_column ).with( :extra_amount, :suffix3 )
        
        use_drain_suffix
      end
    end
    
    it "should set the suffix to DRAIN" do
      event = Event.new
      
      class << event
        use_drain_suffix
      end
      
      event.suffix.should == "DRAIN"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_drain_suffix
        end
        
        @values = [ "111", "112", "113" ]
      end
      
      it "should set amount to the value of the first field" do
        @event.process( nil, @values.clone )
        
        @event.amount.should == @values.first.to_i
      end
      
      it "should set power_type to the value of the second field" do
        @event.process( nil, @values.clone )
        
        @event.power_type.should == @values.second.to_i
      end
      
      it "should set extra_amount to the value of the third field" do
        @event.process( nil, @values.clone )
        
        @event.extra_amount.should == @values.third.to_i
      end
    end
  end
  
  context "use_energize_suffix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :map_column ).with( :amount, :suffix1 )
        self.should_receive( :map_column ).with( :power_type, :suffix2 )
        
        use_energize_suffix
      end
    end
    
    it "should set the suffix to ENERGIZE" do
      event = Event.new
      
      class << event
        use_energize_suffix
      end
      
      event.suffix.should == "ENERGIZE"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_energize_suffix
        end
        
        @values = [ "111", "112" ]
      end
      
      it "should set amount to the value of the first field" do
        @event.process( nil, @values.clone )
        
        @event.amount.should == @values.first.to_i
      end
      
      it "should set power_type to the value of the second field" do
        @event.process( nil, @values.clone )
        
        @event.power_type.should == @values.second.to_i
      end
    end
  end
  
  context "use_extra_attacks_suffix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :map_column ).with( :amount, :suffix1 )
        
        use_extra_attacks_suffix
      end
    end
    
    it "should set the suffix to EXTRA_ATTACKS" do
      event = Event.new
      
      class << event
        use_extra_attacks_suffix
      end
      
      event.suffix.should == "EXTRA_ATTACKS"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_extra_attacks_suffix
        end
        
        @values = [ "111" ]
      end
      
      it "should set amount to the value of the first field" do
        @event.process( nil, @values.clone )
        
        @event.amount.should == @values.first.to_i
      end
    end
  end
  
  context "use_fail_suffix" do
    it "should map columns" do
      event = Event.new

      class << event
        self.should_receive( :belongs_to ).with( :fail_type, :class_name => "FailType", :foreign_key => "suffix1" )

        use_fail_suffix
      end
    end

    it "should set the suffix as FAIL" do
      event = Event.new

      class << event
        use_fail_suffix
      end

      event.suffix.should == "FAIL"
    end
    
    context "#process" do
      before(:each) do
        @event = Event.new
        
        class << @event
          use_fail_suffix
        end
        
        @values = [ "Interrupted" ]
        
        @interrupted = FailType.create!( :name => "Interrupted" )        
      end
      
      it "should map the first field to a fail type" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :fail_type ).with( @values.first ).and_return( @interrupted )
        
        @event.process( factory, @values.clone )
        
        @event.fail_type.should == @interrupted
        @event.suffix1.should == @interrupted.id
      end
    end
  end
  
  context "use_heal_suffix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :map_column ).with( :amount, :suffix1 )
        self.should_receive( :map_column ).with( :overheal, :suffix2 )
        self.should_receive( :map_column ).with( :absorbed, :suffix3 )
        self.should_receive( :map_boolean_column ).with( :critical, :suffix4 )
        
        use_heal_suffix
      end
    end
    
    it "shoulod set the suffix to HEAL" do
      event = Event.new
      
      class << event
        use_heal_suffix
      end
      
      event.suffix.should == "HEAL"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_heal_suffix
        end

        @values = [ "111", "112", "113", "nil" ]
      end
      
      it "should set amount to the value of the first field" do
        @event.process( nil, @values.clone )
      
        @event.amount.should == @values.first.to_i
      end
      
      it "should set overheal to the value of the second field" do
        @event.process( nil, @values.clone )
        
        @event.overheal.should == @values.second.to_i
      end
      
      it "should set absorbed to the value of the third field" do
        @event.process( nil, @values.clone )
        
        @event.absorbed.should == @values.third.to_i
      end
      
      it "should set critical to true if the fourth field is '1'" do
        @values.fourth = "1"
        @event.process_suffix( nil, @values.clone )
        
        @event.critical?.should be_true
      end
      
      it "should set critical to false if the fourth field is 'nil'" do
        @values.fourth = "nil"
        @event.process_suffix( nil, @values.clone )
        
        @event.critical?.should_not be_true
      end

      context "for 3.1 and before" do
        before( :each ) do
          @values = [ "111", "112", "nil" ]
        end
        
        it "should set absorbed to zero" do
          @event.process_suffix( nil, @values.clone )
        
          @event.absorbed.should == 0
        end
      
        it "should set critical to true if the third field is '1'" do
          @values.third = "1"
          @event.process_suffix( nil, @values.clone )
        
          @event.critical?.should be_true
        end
      
        it "should set critical to false if the fourth field is 'nil'" do
          @values.third = "nil"
          @event.process_suffix( nil, @values.clone )
        
          @event.critical?.should_not be_true
        end
      end
    end
  end
  
  context "use_interrupt_suffix" do
    it "should map columns" do
      event = Event.new

      class << event
        self.should_receive( :belongs_to ).with( :extra_spell, :class_name => "Spell", :foreign_key => "suffix1" )

        use_interrupt_suffix
      end
    end

    it "should set the suffix as INTERRUPT" do
      event = Event.new

      class << event
        use_interrupt_suffix
      end

      event.suffix.should == "INTERRUPT"
    end
    
    context "#process" do
      before(:each) do
        @event = Event.new
        
        class << @event
          use_interrupt_suffix
        end
        
        @values = [ "64157", "Curse of Doom", "32" ]
        
        @spell = Spell.create!( :name => "Curse of Doom", :spell_id => 64157, :school => 32 )
      end
      
      it "should map the first three fields to a spell" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :spell ).with( @values.first.to_i, @values.second, @values.third.to_i ).and_return( @spell )
        
        @event.process( factory, @values.clone )
        
        @event.extra_spell.should == @spell
        @event.suffix1.should == @spell.id
      end
    end
  end
  
  context "use_miss_suffix" do
    it "should map columns" do
      event = Event.new

      class << event
        self.should_receive( :belongs_to ).with( :miss_type, :class_name => "MissType", :foreign_key => "suffix1" )
        self.should_receive( :map_column ).with( :amount, :suffix2 )

        use_miss_suffix
      end
    end

    it "should set the suffix as MISS" do
      event = Event.new

      class << event
        use_miss_suffix
      end

      event.suffix.should == "MISS"
    end
    
    context "#process" do
      before(:each) do
        @event = Event.new
        
        class << @event
          use_miss_suffix
        end
        
        @values = [ "MISS", "112" ]
        
        @miss   = MissType.create!( :name => "MISS" )
      end
      
      it "should map the first fields to a miss type" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :miss_type ).with( @values.first ).and_return( @miss )
        
        @event.process( factory, @values.clone )
        
        @event.miss_type.should == @miss
        @event.suffix1.should == @miss.id
      end
      
      it "should set amount to the value in the second field" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :miss_type ).and_return( @miss )
        
        @event.process( factory, @values.clone )
        
        @event.amount.should == @values.second.to_i
      end
      
      it "should set amount to zero if the second field is missing" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :miss_type ).and_return( @miss )
        
        @event.process( factory, [ "MISS" ] )
        
        @event.amount.should == 0
      end
    end
  end
end

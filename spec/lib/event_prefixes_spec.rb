require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EventPrefixes do
  context "use_enchant_prefix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :belongs_to ).with( :enchant, :class_name => "Enchant", :foreign_key => "prefix1" )
        self.should_receive( :belongs_to ).with( :item, :class_name => "Item", :foreign_key => "suffix1" )
        
        use_enchant_prefix
      end
    end
    
    it "should set the prefix as ENCHANT" do
      event = Event.new
      
      class << event
        use_enchant_prefix
      end
      
      event.prefix.should == "ENCHANT"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_enchant_prefix
        end
        
        @flametongue = Enchant.create!( :name => "Flametongue 10" )
        @torch       = Item.create!( :name => "Torch of Holy Fire", :item_id => 40395 )
        
        @values = [ "Flametounge 10", 40395, "Torch of Holy Fire" ]
      end
      
      it "should map the first field to an enchant" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :enchant ).with( @values.first ).and_return( @flametongue )
        factory.should_receive( :item ).and_return( @torch )
        
        @event.process( factory, @values )
        
        @event.enchant.should == @flametongue
        @event.prefix1.should == @flametongue.id
      end
      
      it "should map the second and third fields to an item" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :enchant ).and_return( @flametongue )
        factory.should_receive( :item ).with( @values.second.to_i, @values.third ).and_return( @torch )
        
        @event.process( factory, @values )
        
        @event.item.should == @torch
        @event.suffix1.should == @torch.id
      end
    end
  end

  context "use_environmental_prefix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :belongs_to ).with( :environmental_type, :class_name => "EnvironmentalType", :foreign_key => "prefix1" )
        
        use_environmental_prefix
      end
    end
    
    it "should set the prefix as ENVIRONMENTAL" do
      event = Event.new
      
      class << event
        use_environmental_prefix
      end
      
      event.prefix.should == "ENVIRONMENTAL"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_environmental_prefix
        end
        
        @falling = EnvironmentalType.create!( :name => "FALLING" )
        
        @values = [ "FALLING" ]
      end
      
      it "should map the first field to an environmental type" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :environmental_type ).with( @values.first ).and_return( @falling )
        
        @event.process( factory, @values )
        
        @event.environmental_type.should == @falling
        @event.prefix1.should == @falling.id
      end
    end
  end

  context "use_spell_prefix" do
    it "should map columns" do
      event = Event.new
      
      class << event
        self.should_receive( :belongs_to ).with( :spell, :class_name => "Spell", :foreign_key => "prefix1" )
        
        use_spell_prefix
      end
    end
    
    it "should set the prefix as SPELL" do
      event = Event.new
      
      class << event
        use_spell_prefix
      end
      
      event.prefix.should == "SPELL"
    end
    
    context "#process" do
      before( :each ) do
        @event = Event.new
        
        class << @event
          use_spell_prefix
        end
        
        @fireball = Spell.create!( :name => "Fireball", :spell_id => 42833, :school => 0x4 )
                
        @values = [ "42833", "Fireball", "0x4" ]
      end
      
      it "should map the first three field to a spell" do
        factory = mock( "EventFactory" )
        
        factory.should_receive( :spell ).with( @values.first.to_i, @values.second, @values.third.hex ).and_return( @fireball )
        
        @event.process( factory, @values )
        
        @event.spell.should == @fireball
        @event.prefix1.should == @fireball.id
      end
    end
  end
end
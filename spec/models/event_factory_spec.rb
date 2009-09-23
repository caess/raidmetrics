require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EventFactory do
  before( :each ) do
    @factory = EventFactory.new
  end
  
  it "should create a DAMAGE_SHIELD event from a DAMAGE_SHIELD line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 23:07:10' ) )
    
    mathom = Unit.create!( :name => "Mathom", :guid => 0x020000000032D896 )
    ignis = Unit.create!( :name => "Ignis the Furnace Master", :guid => 0xF15000815E01027D )
    thorns = Spell.create!( :name => "Thorns", :spell_id => 53307, :school => 0x8 )
    
    line = '7/2 23:07:15.823  DAMAGE_SHIELD,0x020000000032D896,"Mathom",0x514,0xF15000815E01027D,"Ignis the Furnace Master",0x10a48,53307,"Thorns",0x8,127,0,8,0,0,0,nil,nil,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "DamageShieldEvent"
    event.offset.should == BigDecimal( '5.823' )
    event.source.should == mathom
    event.destination.should == ignis
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x10a48
    
    event.amount.should == 127
    event.overkill.should == 0
    event.school.should == 8
    event.resisted.should == 0
    event.blocked.should == 0
    event.absorbed.should == 0
    event.should_not be_critical
    event.should_not be_glancing
    event.should_not be_crushing
  end

  it "should create a DAMAGE_SHIELD_MISSED event from a DAMAGE_SHIELD_MISSED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/25 20:37:00' ) )
    
    mathom = Unit.create!( :name => "Mathom", :guid => 0x020000000032D896 )
    kologarn = Unit.create!( :name => "Kologarn", :guid => 0xF1500080A201C21C )
    thorns = Spell.create!( :name => "Thorns", :spell_id => 53307, :school => 0x8 )
    resisted = MissType.create!( :name => "RESIST" )
    
    line = '7/25 20:37:05.099  DAMAGE_SHIELD_MISSED,0x020000000032D896,"Mathom",0x514,0xF1500080A201C21C,"Kologarn",0x10a48,53307,"Thorns",0x8,RESIST,0'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "DamageShieldMissedEvent"
    event.offset.should == BigDecimal( '5.099' )
    event.source.should == mathom
    event.destination.should == kologarn
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x10a48
    
    event.spell.should == thorns
    event.miss_type.should == resisted
    event.amount.should == 0
  end

  it "should create a DAMAGE_SPLIT event from a DAMAGE_SPLIT line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:11:00' ) )
    
    mathom = Unit.create!( :name => "Mathom", :guid => 0x020000000032D896 )
    rayen  = Unit.create!( :name => "Rayen",  :guid => 0x02000000003192E9 )
    divine_sacrifice = Spell.create!( :name => "Thorns", :spell_id => 64205, :school => 0x1 )
    
    line = '7/2 20:11:46.500  DAMAGE_SPLIT,0x020000000032D896,"Mathom",0x8000514,0x02000000003192E9,"Rayen",0x512,64205,"Divine Sacrifice",0x1,0,0,16,0,0,0,nil,nil,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "DamageSplitEvent"
    event.offset.should == BigDecimal( '46.500' )
    event.source.should == mathom
    event.destination.should == rayen
    event.source_flags.should == 0x8000514
    event.destination_flags.should == 0x512
    
    event.spell.should == divine_sacrifice
    
    event.amount.should   == 0
    event.overkill.should == 0
    event.school.should   == 16
    event.resisted.should == 0
    event.blocked.should  == 0
    event.absorbed.should == 0
    event.should_not be_critical
    event.should_not be_glancing
    event.should_not be_crushing
  end

  it "should create an ENCHANT_APPLIED event from an ENCHANT_APPLIED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 19:48:15' ) )
    
    cusimanse   = Unit.create!( :name => "Cusimanse", :guid => 0x0200000000D8ACBF )
    flametongue = Enchant.create!( :name => "Flametongue 10" )
    torch       = Item.create!( :name => "Torch of Holy Fire", :item_id => 40395 )
    
    line = '7/2 19:48:16.941  ENCHANT_APPLIED,0x0200000000D8ACBF,"Cusimanse",0x512,0x0200000000D8ACBF,"Cusimanse",0x512,"Flametongue 10",40395,"Torch of Holy Fire"'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "EnchantAppliedEvent"
    event.offset.should == BigDecimal( '1.941' )
    event.source.should == cusimanse
    event.destination.should == cusimanse
    event.source_flags.should == 0x512
    event.destination_flags.should == 0x512
    
    event.enchant.should == flametongue
    event.item.should    == torch
  end

  it "should create an ENCHANT_REMOVED event from an ENCHANT_REMOVED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 19:48:15' ) )
    
    cusimanse   = Unit.create!( :name => "Cusimanse", :guid => 0x0200000000D8ACBF )
    flametongue = Enchant.create!( :name => "Flametongue 10" )
    torch       = Item.create!( :name => "Torch of Holy Fire", :item_id => 40395 )
    
    line = '7/2 19:48:16.941  ENCHANT_REMOVED,0x0000000000000000,nil,0x80000000,0x0200000000D8ACBF,"Cusimanse",0x512,"Flametongue 10",40395,"Torch of Holy Fire"'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "EnchantRemovedEvent"
    event.offset.should == BigDecimal( '1.941' )
    event.source.should be_nil
    event.destination.should == cusimanse
    event.source_flags.should == 0x80000000
    event.destination_flags.should == 0x512
    
    event.enchant.should == flametongue
    event.item.should    == torch
  end

  it "should create an ENVIRONMENTAL_DAMAGE event from a ENVIRONMENTAL_DAMAGE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:08:00' ) )

    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    falling = EnvironmentalType.create!( :name => "FALLING" )
    
    line = '7/2 20:08:42.314  ENVIRONMENTAL_DAMAGE,0x0000000000000000,nil,0x80000000,0x0200000000322CF9,"Phaedra",0x511,FALLING,2622,0,1,0,0,0,nil,nil,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "EnvironmentalDamageEvent"
    event.offset.should == BigDecimal( '42.314' )
    event.source.should be_nil
    event.destination.should == phaedra
    event.source_flags.should == 0x80000000
    event.destination_flags.should == 0x511
    
    event.environmental_type.should == falling
    
    event.amount.should   == 2622
    event.overkill.should == 0
    event.school.should   == 1
    event.resisted.should == 0
    event.blocked.should  == 0
    event.absorbed.should == 0
    event.should_not be_critical
    event.should_not be_glancing
    event.should_not be_crushing
  end

  it "should create a PARTY_KILL event from a PARTY_KILL line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:02:00' ) )
    
    phaedra   = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    thunderer = Unit.create!( :name => "Dark Rune Thunderer", :guid => 0xF1300083DA0101F9 )
    
    line = '7/2 20:03:18.350  PARTY_KILL,0x0200000000322CF9,"Phaedra",0x511,0xF1300083DA0101F9,"Dark Rune Thunderer",0x10a48'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "PartyKillEvent"
    event.offset.should == BigDecimal( '78.350' )
    event.source.should == phaedra
    event.destination.should == thunderer
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x10a48
  end

  it "should create a RANGE_DAMAGE event from a RANGE_DAMAGE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 21:37:00' ) )

    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    vezax   = Unit.create!( :name => "General Vezax", :guid => 0xF1300081F7023FE9 )
    shoot   = Spell.create!( :name => "Shoot", :spell_id => 5019, :school => 0x1 )
    
    line = '7/2 21:37:03.310  RANGE_DAMAGE,0x0200000000322CF9,"Phaedra",0x511,0xF1300081F7023FE9,"General Vezax",0x10a48,5019,"Shoot",0x1,657,0,2,0,0,0,nil,nil,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "RangeDamageEvent"
    event.offset.should == BigDecimal( '3.310' )
    event.source.should == phaedra
    event.destination.should == vezax
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x10a48
    
    event.amount.should == 657
    event.overkill.should == 0
    event.school.should == 2
    event.resisted.should == 0
    event.blocked.should == 0
    event.absorbed.should == 0
    event.should_not be_critical
    event.should_not be_glancing
    event.should_not be_crushing
  end

  it "should create a RANGE_MISSED event from a RANGE_MISSED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 21:37:00' ) )
    
    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    vezax   = Unit.create!( :name => "General Vezax", :guid => 0xF1300081F7023FE9 )
    shoot   = Spell.create!( :name => "Shoot", :spell_id => 5019, :school => 0x1 )
    missed  = MissType.create!( :name => "MISS" )
    
    line = '7/2 21:37:05.485  RANGE_MISSED,0x0200000000322CF9,"Phaedra",0x511,0xF1300081F7023FE9,"General Vezax",0x10a48,5019,"Shoot",0x1,MISS'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "RangeMissedEvent"
    event.offset.should == BigDecimal( '5.485' )
    event.source.should == phaedra
    event.destination.should == vezax
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x10a48
    
    event.spell.should == shoot
    event.miss_type.should == missed
    event.amount.should == 0
  end

  it "should create a SPELL_AURA_APPLIED event from a SPELL_AURA_APPLIED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 19:47:00' ) )
    
    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    mathom  = Unit.create!( :name => "Mathom", :guid => 0x020000000032D896 )
    pack    = Spell.create!( :name => "Leader of the Pack", :spell_id => 24932, :school => 0x1 )
    
    line = '7/2 19:47:27.438  SPELL_AURA_APPLIED,0x020000000032D896,"Mathom",0x514,0x0200000000322CF9,"Phaedra",0x511,24932,"Leader of the Pack",0x1,BUFF'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellAuraAppliedEvent"
    event.offset.should == BigDecimal( '27.438' )
    event.source.should == mathom
    event.destination.should == phaedra
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x511
    
    event.spell.should == pack
    
    event.should be_buff
  end
  
  it "should create a SPELL_AURA_APPLIED_DOSE event from a SPELL_AURA_APPLIED_DOSE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:02:00' ) )
    
    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    ids     = Spell.create!( :name => "Illustration of the Dragon Soul", :spell_id => 60486, :school => 0x1 )
    
    line = '7/2 20:02:22.427  SPELL_AURA_APPLIED_DOSE,0x0200000000322CF9,"Phaedra",0x511,0x0200000000322CF9,"Phaedra",0x511,60486,"Illustration of the Dragon Soul",0x1,BUFF,2'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellAuraAppliedDoseEvent"
    event.offset.should == BigDecimal( '22.427' )
    event.source.should == phaedra
    event.destination.should == phaedra
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x511
    
    event.spell.should == ids
    
    event.should be_buff
    event.amount.should == 2
  end

  it "should create a SPELL_AURA_BROKEN event from a SPELL_AURA_BROKEN line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/13 20:27:00' ) )
    
    acalan  = Unit.create!( :name => "Acalan", :guid => 0x0200000002C26127 )
    yshan   = Unit.create!( :name => "Yshan",  :guid => 0x0200000000306143 )
    blind   = Spell.create!( :name => "Blind", :spell_id => 2094, :school => 0x1 )
    
    line = '7/13 20:27:08.321  SPELL_AURA_BROKEN,0x0200000002C26127,"Acalan",0x1248,0x0200000000306143,"Yshan",0x514,2094,"Blind",0x1,DEBUFF'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellAuraBrokenEvent"
    event.offset.should == BigDecimal( '8.321' )
    event.source.should == acalan
    event.destination.should == yshan
    event.source_flags.should == 0x1248
    event.destination_flags.should == 0x514
    
    event.spell.should == blind
    
    event.should_not be_buff
  end

  it "should create a SPELL_AURA_BROKEN_SPELL event from a SPELL_AURA_BROKEN_SPELL line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 22:36:00' ) )

    phaedra  = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    animus   = Unit.create!( :name => "Saronite Animus",  :guid => 0xF1300082F403184A )
    invis    = Spell.create!( :name => "Invisibility", :spell_id => 66, :school => 0x40 )
    darkness = Spell.create!( :name => "Profound Darkness", :spell_id => 63420, :school => 32 )
    
    line = '7/2 22:36:50.757  SPELL_AURA_BROKEN_SPELL,0xF1300082F403184A,"Saronite Animus",0x10a48,0x0200000000322CF9,"Phaedra",0x2000511,66,"Invisibility",0x40,63420,"Profound Darkness",32,BUFF'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellAuraBrokenSpellEvent"
    event.offset.should == BigDecimal( '50.757' )
    event.source.should == animus
    event.destination.should == phaedra
    event.source_flags.should == 0x10a48
    event.destination_flags.should == 0x2000511
    
    event.spell.should == invis
    
    event.extra_spell.should == darkness
    event.should be_buff
  end

  it "should create a SPELL_AURA_REFRESH event from a SPELL_AURA_REFRESH line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 19:59:00' ) )

    alamanda = Unit.create!( :name => "Alamanda", :guid => 0x020000000032BB59 )
    phaedra  = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    prayer   = Spell.create!( :name => "Prayer of Spirit", :spell_id => 48074, :school => 0x2 )

    line = '7/2 19:59:52.180  SPELL_AURA_REFRESH,0x020000000032BB59,"Alamanda",0x512,0x0200000000322CF9,"Phaedra",0x511,48074,"Prayer of Spirit",0x2,BUFF'

    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil

    event.class.name.should == "SpellAuraRefreshEvent"
    event.offset.should == BigDecimal( '52.180' )
    event.source.should == alamanda
    event.destination.should == phaedra
    event.source_flags.should == 0x512
    event.destination_flags.should == 0x511

    event.spell.should == prayer

    event.should be_buff
  end

  it "should create a SPELL_AURA_REMOVED event from a SPELL_AURA_REMOVED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 23:07:17' ) )
    
    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    hot_streak = Spell.create!( :name => "Hot Streak", :spell_id => 48108, :school => 0x1 )
    
    line = '7/2 23:07:17.378  SPELL_AURA_REMOVED,0x0200000000322CF9,"Phaedra",0x511,0x0200000000322CF9,"Phaedra",0x511,48108,"Hot Streak",0x1,BUFF'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellAuraRemovedEvent"
    event.offset.should == BigDecimal( '0.378' )
    event.source.should == phaedra
    event.destination.should == phaedra
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x511
    
    event.spell.should == hot_streak
    
    event.should be_buff
  end

  it "should create a SPELL_AURA_REMOVED_DOSE event from a SPELL_AURA_REMOVED_DOSE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 23:25:00' ) )

    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    sanity  = Spell.create!( :name => "Sanity", :spell_id => 63050, :school => 0x1 )

    line = '7/2 23:25:26.661  SPELL_AURA_REMOVED_DOSE,0x0000000000000000,nil,0x80000000,0x0200000000322CF9,"Phaedra",0x511,63050,"Sanity",0x1,DEBUFF,91'

    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil

    event.class.name.should == "SpellAuraRemovedDoseEvent"
    event.offset.should == BigDecimal( '26.661' )
    event.source.should be_nil
    event.destination.should == phaedra
    event.source_flags.should == 0x80000000
    event.destination_flags.should == 0x511

    event.spell.should == sanity

    event.should_not be_buff
    event.amount.should == 91
  end

  it "should create a SPELL_BUILDING_DAMAGE event from a SPELL_BUIDLING_DAMAGE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/25 19:58:00' ) )
    
    demo   = Unit.create!( :name => "Salvaged Demolisher Mechanic Seat", :guid => 0xF15000818F014D0C )
    beacon = Unit.create!( :name => "Storm Beacon", :guid => 0xF11002F76E0021B4 )
    mortar = Spell.create!( :name => "Mortar", :spell_id => 62635, :school => 0x4 )
    
    line = '7/25 19:58:25.009  SPELL_BUILDING_DAMAGE,0xF15000818F014D0C,"Salvaged Demolisher Mechanic Seat",0x1111,0xF11002F76E0021B4,"Storm Beacon",0x4228,62635,"Mortar",0x4,351,0,4,0,0,0,nil,nil,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellBuildingDamageEvent"
    event.offset.should == BigDecimal( '25.009' )
    event.source.should == demo
    event.destination.should == beacon
    event.source_flags.should == 0x1111
    event.destination_flags.should == 0x4228
    
    event.amount.should == 351
    event.overkill.should == 0
    event.school.should == 4
    event.resisted.should == 0
    event.blocked.should == 0
    event.absorbed.should == 0
    event.should_not be_critical
    event.should_not be_glancing
    event.should_not be_crushing
  end
  
  it "should create a SPELL_CAST_FAILED event from a SPELL_CAST_FAILED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:03:00' ) )

    phaedra     = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    fireball    = Spell.create!( :name => "Fireball", :spell_id => 42833, :school => 0x4 )
    interrupted = FailType.create!( :name => "Interrupted" )
    
    line = '7/2 20:03:18.676  SPELL_CAST_FAILED,0x0200000000322CF9,"Phaedra",0x511,0x0000000000000000,nil,0x80000000,42833,"Fireball",0x4,"Interrupted"'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellCastFailedEvent"
    event.offset.should == BigDecimal( '18.676' )
    event.source.should == phaedra
    event.destination.should be_nil
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x80000000
    
    event.spell.should == fireball
    
    event.fail_type.should == interrupted
  end
  
  it "should create a SPELL_CAST_START event from a SPELL_CAST_START line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:02:00' ) )

    phaedra     = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    fireball    = Spell.create!( :name => "Fireball", :spell_id => 42833, :school => 0x4 )
    
    line = '7/2 20:02:20.085  SPELL_CAST_START,0x0200000000322CF9,"Phaedra",0x511,0x0000000000000000,nil,0x80000000,42833,"Fireball",0x4'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellCastStartEvent"
    event.offset.should == BigDecimal( '20.085' )
    event.source.should == phaedra
    event.destination.should be_nil
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x80000000
    
    event.spell.should == fireball
  end
  
  it "should create a SPELL_CAST_SUCCESS event from a SPELL_CAST_SUCCESS line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:00:00' ) )

    phaedra      = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    molten_armor = Spell.create!( :name => "Molten Armor", :spell_id => 43046, :school => 0x4 )
    
    line = '7/2 20:00:25.181  SPELL_CAST_SUCCESS,0x0200000000322CF9,"Phaedra",0x511,0x0000000000000000,nil,0x80000000,43046,"Molten Armor",0x4'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellCastSuccessEvent"
    event.offset.should == BigDecimal( '25.181' )
    event.source.should == phaedra
    event.destination.should be_nil
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x80000000
    
    event.spell.should == molten_armor
  end
  
  it "should create a SPELL_CREATE event from a SPELL_CREATE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 19:50:00' ) )

    lochnar = Unit.create!( :name => "Lochnar", :guid => 0x020000000030A56A )
    portal  = Unit.create!( :name => "Refreshment Portal", :guid => 0xF11002F22600253E )
    ritual = Spell.create!( :name => "Ritual of Refreshment", :spell_id => 58659, :school => 0x40 )
    
    line = '7/2 19:50:28.453  SPELL_CREATE,0x020000000030A56A,"Lochnar",0x512,0xF11002F22600253E,"Refreshment Portal",0x4228,58659,"Ritual of Refreshment",0x40'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellCreateEvent"
    event.offset.should == BigDecimal( '28.453' )
    event.source.should == lochnar
    event.destination.should == portal
    event.source_flags.should == 0x512
    event.destination_flags.should == 0x4228
    
    event.spell.should == ritual
  end
  
  it "should create a SPELL_DAMAGE event from a SPELL_DAMAGE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:02:00' ) )

    phaedra  = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    ravager  = Unit.create!( :name => "Rark Rune Ravager", :guid => 0xF1300083DB0101F8 )
    fireball = Spell.create!( :name => "Fireball", :spell_id => 42833, :school => 0x4 )
    
    line = '7/2 20:02:23.568  SPELL_DAMAGE,0x0200000000322CF9,"Phaedra",0x511,0xF1300083DB0101F8,"Dark Rune Ravager",0x8010a48,42833,"Fireball",0x4,9961,0,4,0,0,0,1,nil,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellDamageEvent"
    event.offset.should == BigDecimal( '23.568' )
    event.source.should == phaedra
    event.destination.should == ravager
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x8010a48
    
    event.spell.should == fireball
    
    event.amount.should == 9961
    event.overkill.should == 0
    event.school.should == 4
    event.resisted.should == 0
    event.blocked.should == 0
    event.absorbed.should == 0
    event.should be_critical
    event.should_not be_glancing
    event.should_not be_crushing
  end
  
  it "should create a SPELL_DISPEL event from a SPELL_DISPEL line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/13 20:25:00' ) )

    phaedra       = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    remove_curse  = Spell.create!( :name => "Remove Curse", :spell_id => 475, :school => 0x40 )
    curse_of_doom = Spell.create!( :name => "Curse of Doom", :spell_id => 64157, :school => 32 )
    
    line = '7/13 20:25:49.464  SPELL_DISPEL,0x0200000000322CF9,"Phaedra",0x511,0x0200000000322CF9,"Phaedra",0x511,475,"Remove Curse",0x40,64157,"Curse of Doom",32,DEBUFF'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellDispelEvent"
    event.offset.should == BigDecimal( '49.464' )
    event.source.should == phaedra
    event.destination.should == phaedra
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x511
    
    event.spell.should == remove_curse
    
    event.extra_spell.should == curse_of_doom
    event.should_not be_buff
  end
  
  it "should create a SPELL_DISPEL_FAILED event from a SPELL_DISPEL_FAILED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:38:00' ) )

    fineas       = Unit.create!( :name => "Fineas", :guid => 0x02000000026B2324 )
    dispel_magic = Spell.create!( :name => "Dispel Magic", :spell_id => 988, :school => 0x2 )
    ice_nova     = Spell.create!( :name => "Ice Nova", :spell_id => 66346, :school => 16 )
    
    line = '7/2 20:38:40.613  SPELL_DISPEL_FAILED,0x02000000026B2324,"Fineas",0x1000514,0x02000000026B2324,"Fineas",0x1000514,988,"Dispel Magic",0x2,66346,"Ice Nova",16'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellDispelFailedEvent"
    event.offset.should == BigDecimal( '40.613' )
    event.source.should == fineas
    event.destination.should == fineas
    event.source_flags.should == 0x1000514
    event.destination_flags.should == 0x1000514
    
    event.spell.should == dispel_magic
    
    event.extra_spell.should == ice_nova
  end
  
  it "should create a SPELL_ENERGIZE event from a SPELL_ENERGIZE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:02:00' ) )

    mathom = Unit.create!( :name => "Mathom", :guid => 0x020000000032D896 )
    furor  = Spell.create!( :name => "Furor", :spell_id => 17057, :school => 0x1 )
    
    line = '7/2 20:02:06.454  SPELL_ENERGIZE,0x020000000032D896,"Mathom",0x514,0x020000000032D896,"Mathom",0x514,17057,"Furor",0x1,10,1'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellEnergizeEvent"
    event.offset.should == BigDecimal( '6.454' )
    event.source.should == mathom
    event.destination.should == mathom
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x514
    
    event.spell.should == furor
    
    event.amount.should == 10
    event.power_type.should == 1
  end
  
  it "should create a SPELL_EXTRA_ATTACKS event from a SPELL_EXTRA_ATTACKS line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/13 22:47:00' ) )

    shalandrax = Unit.create!( :name => "Shalandrax", :guid => 0x0200000000307EB8 )
    sword_spec = Spell.create!( :name => "Sword Specialization", :spell_id => 16459, :school => 0x1 )
    
    line = '7/13 22:47:03.585  SPELL_EXTRA_ATTACKS,0x0200000000307EB8,"Shalandrax",0x514,0x0200000000307EB8,"Shalandrax",0x514,16459,"Sword Specialization",0x1,1'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellExtraAttacksEvent"
    event.offset.should == BigDecimal( '3.585' )
    event.source.should == shalandrax
    event.destination.should == shalandrax
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x514
    
    event.spell.should == sword_spec
    
    event.amount.should == 1
  end
  
  it "should create a SPELL_HEAL event from a 3.1 SPELL_HEAL line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:03:00' ) )

    fineas  = Unit.create!( :name => "Fineas", :guid => 0x02000000026B2324 )
    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    coh     = Spell.create!( :name => "Circle of Healing", :spell_id => 48089, :school => 0x2 )
    
    line = '7/2 20:03:15.947  SPELL_HEAL,0x02000000026B2324,"Fineas",0x1000514,0x0200000000322CF9,"Phaedra",0x511,48089,"Circle of Healing",0x2,3066,3066,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellHealEvent"
    event.offset.should == BigDecimal( '15.947' )
    event.source.should == fineas
    event.destination.should == phaedra
    event.source_flags.should == 0x1000514
    event.destination_flags.should == 0x511
    
    event.spell.should == coh
    
    event.amount.should == 3066
    event.overheal.should == 3066
    event.absorbed.should == 0
    event.should_not be_critical
  end
  
  it "should create a SPELL_HEAL event from a 3.2 SPELL_HEAL line" do
    @factory.raid = Raid.new( :time => Time.parse( '9/3 19:51:00' ) )

    fineas  = Unit.create!( :name => "Fineas", :guid => 0x02000000026B2324 )
    phaedra = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    poh     = Spell.create!( :name => "Prayer of Healing", :spell_id => 48072, :school => 0x2 )
    
    line = '9/3 19:51:47.552  SPELL_HEAL,0x02000000026B2324,"Fineas",0x512,0x0200000000322CF9,"Phaedra",0x511,48072,"Prayer of Healing",0x2,6527,6527,0,1'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellHealEvent"
    event.offset.should == BigDecimal( '47.552' )
    event.source.should == fineas
    event.destination.should == phaedra
    event.source_flags.should == 0x512
    event.destination_flags.should == 0x511
    
    event.spell.should == poh
    
    event.amount.should == 6527
    event.overheal.should == 6527
    event.absorbed.should == 0
    event.should be_critical
  end
  
  it "should create a SPELL_INSTAKILL event from a SPELL_INSTAKILL line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:22:00' ) )

    rayen               = Unit.create!( :name => "Rayen",  :guid => 0x02000000003192E9 )
    divine_intervention = Spell.create!( :name => "Divine Intervention", :spell_id => 19752, :school => 0x2 )
    
    line = '7/2 20:22:15.691  SPELL_INSTAKILL,0x02000000003192E9,"Rayen",0x512,0x02000000003192E9,"Rayen",0x512,19752,"Divine Intervention",0x2'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellInstakillEvent"
    event.offset.should == BigDecimal( '15.691' )
    event.source.should == rayen
    event.destination.should == rayen
    event.source_flags.should == 0x512
    event.destination_flags.should == 0x512
    
    event.spell.should == divine_intervention
  end
  
  it "should create a SPELL_INTERRUPT event from a SPELL_INTERRUPT line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:07:00' ) )

    phaedra      = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    acolyte      = Unit.create!( :name => "Dark Rune Acolyte", :guid => 0xF1300081560103FE )
    counterspell = Spell.create!( :name => "Counterspell", :spell_id => 2139, :school => 0x40 )
    greater_heal = Spell.create!( :name => "Greater Heal", :spell_id => 62334, :school => 2 )
    
    line = '7/2 20:07:37.519  SPELL_INTERRUPT,0x0200000000322CF9,"Phaedra",0x511,0xF1300081560103FE,"Dark Rune Acolyte",0x10a48,2139,"Counterspell",0x40,62334,"Greater Heal",2'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellInterruptEvent"
    event.offset.should == BigDecimal( '37.519' )
    event.source.should == phaedra
    event.destination.should == acolyte
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x10a48
    
    event.spell.should == counterspell
    
    event.extra_spell.should == greater_heal
  end
  
  it "should create a SPELL_LEECH event from a SPELL_LEECH line" do
    @factory.raid = Raid.new( :time => Time.parse( '1/19 20:26:00' ) )

    mengamy   = Unit.create!( :name => "Mengamy", :guid => 0x0000000000335D21 )
    ghaathun  = Unit.create!( :name => "Ghaathun", :guid => 0xF140086BD200003A )
    dark_pact = Spell.create!( :name => "Dark Pact", :spell_id => 59092, :school => 0x20 )
    
    line = '1/19 20:26:41.090  SPELL_LEECH,0x0000000000335D21,"Mengamy",0x514,0xF140086BD200003A,"Ghaathun",0x1114,59092,"Dark Pact",0x20,3155,0,3155'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellLeechEvent"
    event.offset.should == BigDecimal( '41.090' )
    event.source.should == mengamy
    event.destination.should == ghaathun
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x1114
    
    event.spell.should == dark_pact
    
    event.amount.should == 3155
    event.power_type.should == 0
    event.extra_amount.should == 3155
  end
  
  it "should create a SPELL_MISSED event from a SPELL_MISSED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:10:00' ) )

    phaedra     = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    thorim      = Unit.create!( :name => "Thorim", :guid => 0xF130008061010406 )
    living_bomb = Spell.create!( :name => "Living Bomb", :spell_id => 55362, :school => 0x4 )
    miss        = MissType.create!( :name => "MISS" )
    
    line = '7/2 20:10:46.903  SPELL_MISSED,0x0200000000322CF9,"Phaedra",0x511,0xF130008061010406,"Thorim",0x10a48,55362,"Living Bomb",0x4,MISS'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellMissedEvent"
    event.offset.should == BigDecimal( '46.903' )
    event.source.should == phaedra
    event.destination.should == thorim
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x10a48
    
    event.spell.should == living_bomb
    
    event.miss_type.should == miss
    event.amount.should == 0
  end
  
  it "should create a SPELL_PERIODIC_DAMAGE event from a SPELL_PERIODIC_DAMAGE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:02:00' ) )

    phaedra     = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    ravager     = Unit.create!( :name => "Rark Rune Ravager", :guid => 0xF1300083DB0101F8 )
    living_bomb = Spell.create!( :name => "Living Bomb", :spell_id => 55360, :school => 0x4 )
    
    line = '7/2 20:02:21.490  SPELL_PERIODIC_DAMAGE,0x0200000000322CF9,"Phaedra",0x511,0xF1300083DB0101F8,"Dark Rune Ravager",0x8010a48,55360,"Living Bomb",0x4,865,0,4,0,0,0,nil,nil,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellPeriodicDamageEvent"
    event.offset.should == BigDecimal( '21.490' )
    event.source.should == phaedra
    event.destination.should == ravager
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x8010a48
    
    event.spell.should == living_bomb
    
    event.amount.should == 865
    event.overkill.should == 0
    event.school.should == 4
    event.resisted.should == 0
    event.blocked.should == 0
    event.absorbed.should == 0
    event.should_not be_critical
    event.should_not be_glancing
    event.should_not be_crushing
  end
  
  it "should create a SPELL_PERIODIC_DRAIN event from a SPELL_PERIODIC_DRAIN line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/13 20:24:00' ) )

    rayen           = Unit.create!( :name => "Rayen",  :guid => 0x02000000003192E9 )
    tentacle        = Unit.create!( :name => "Corruptor Tentacle", :guid => 0xF1300084C10183C0 )
    draining_poison = Spell.create!( :name => "Draining Poison", :spell_id => 64152, :school => 0x8 )
    
    line = '7/13 20:24:32.887  SPELL_PERIODIC_DRAIN,0xF1300084C10183C0,"Corruptor Tentacle",0xa48,0x02000000003192E9,"Rayen",0x514,64152,"Draining Poison",0x8,1400,0,0'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellPeriodicDrainEvent"
    event.offset.should == BigDecimal( '32.887' )
    event.source.should == tentacle
    event.destination.should == rayen
    event.source_flags.should == 0xa48
    event.destination_flags.should == 0x514
    
    event.spell.should == draining_poison
    
    event.amount.should == 1400
    event.power_type.should == 0
    event.extra_amount.should == 0
  end  
  
  it "should create a SPELL_PERIODIC_ENERGIZE event from a SPELL_PERIODIC_ENERGIZE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:00:00' ) )

    rayen       = Unit.create!( :name => "Rayen",  :guid => 0x02000000003192E9 )
    divine_plea = Spell.create!( :name => "Divine Plea", :spell_id => 54428, :school => 0x2 )
    
    line = '7/2 20:00:26.384  SPELL_PERIODIC_ENERGIZE,0x02000000003192E9,"Rayen",0x512,0x02000000003192E9,"Rayen",0x512,54428,"Divine Plea",0x2,325,0'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellPeriodicEnergizeEvent"
    event.offset.should == BigDecimal( '26.384' )
    event.source.should == rayen
    event.destination.should == rayen
    event.source_flags.should == 0x512
    event.destination_flags.should == 0x512
    
    event.spell.should == divine_plea
    
    event.amount.should == 325
    event.power_type.should == 0
  end
  
  it "should create a SPELL_PERIODIC_HEAL event from a 3.1 SPELL_PERIODIC_HEAL line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 19:59:00' ) )

    yshan       = Unit.create!( :name => "Yshan", :guid => 0x0200000000306143 )
    rayen       = Unit.create!( :name => "Rayen", :guid => 0x02000000003192E9 )
    wild_growth = Spell.create!( :name => "Wild Growth", :spell_id => 53251, :school => 0x8 )
    
    line = '7/2 19:59:51.594  SPELL_PERIODIC_HEAL,0x0200000000306143,"Yshan",0x514,0x02000000003192E9,"Rayen",0x512,53251,"Wild Growth",0x8,845,0,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellPeriodicHealEvent"
    event.offset.should == BigDecimal( '51.594' )
    event.source.should == yshan
    event.destination.should == rayen
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x512
    
    event.spell.should == wild_growth
    
    event.amount.should == 845
    event.overheal.should == 0
    event.absorbed.should == 0
    event.should_not be_critical
  end
  
  it "should create a SPELL_PERIODIC_HEAL event from a 3.2 SPELL_PERIODIC_HEAL line" do
    @factory.raid = Raid.new( :time => Time.parse( '9/3 23:15:00' ) )

    rayen    = Unit.create!( :name => "Rayen", :guid => 0x02000000003192E9 )
    imp_pack = Spell.create!( :name => "Improved Leader of the Pack", :spell_id => 34299, :school => 0x1 )
    
    line = '9/3 23:15:11.465  SPELL_PERIODIC_HEAL,0x02000000003192E9,"Rayen",0x514,0x02000000003192E9,"Rayen",0x514,34299,"Improved Leader of the Pack",0x1,1181,0,0,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellPeriodicHealEvent"
    event.offset.should == BigDecimal( '11.465' )
    event.source.should == rayen
    event.destination.should == rayen
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x514
    
    event.spell.should == imp_pack
    
    event.amount.should == 1181
    event.overheal.should == 0
    event.absorbed.should == 0
    event.should_not be_critical
  end
  
  it "should create a SPELL_PERIODIC_LEECH event from a SPELL_PERIODIC_LEECH line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/26 22:55:00' ) )

    phaedra     = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    trakas      = Unit.create!( :name => "Trakas",  :guid => 0x0200000001486736 )
    viper_sting = Spell.create!( :name => "Viper Sting", :spell_id => 3034, :school => 0x8 )
    
    line = '7/26 22:55:07.266  SPELL_PERIODIC_LEECH,0x0200000001486736,"Trakas",0x8001248,0x0200000000322CF9,"Phaedra",0x511,3034,"Viper Sting",0x8,216,0,648'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellPeriodicLeechEvent"
    event.offset.should == BigDecimal( '7.266' )
    event.source.should == trakas
    event.destination.should == phaedra
    event.source_flags.should == 0x8001248
    event.destination_flags.should == 0x511
    
    event.spell.should == viper_sting
    
    event.amount.should == 216
    event.power_type.should == 0
    event.extra_amount.should == 648
  end
  
  it "should create a SPELL_PERIODIC_MISSED event from a SPELL_PERIODIC_MISSED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:53:00' ) )

    vx001     = Unit.create!( :name => "VX-001", :guid => 0xF15000837301F20F )
    phaedra   = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    heat_wave = Spell.create!( :name => "Heat Wave", :spell_id => 63677, :school => 0x4 )
    absorb    = MissType.create!( :name => "ABSORB" )
    
    line = '7/2 20:53:13.981  SPELL_PERIODIC_MISSED,0xF15000837301F20F,"VX-001",0x10a48,0x0200000000322CF9,"Phaedra",0x511,63677,"Heat Wave",0x4,ABSORB,2060'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellPeriodicMissedEvent"
    event.offset.should == BigDecimal( '13.981' )
    event.source.should == vx001
    event.destination.should == phaedra
    event.source_flags.should == 0x10a48
    event.destination_flags.should == 0x511
    
    event.spell.should == heat_wave
    
    event.miss_type.should == absorb
    event.amount.should == 2060
  end
  
  it "should create a SPELL_RESURRECT event from a SPELL_RESSURECT line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:31:00' ) )

    alamanda     = Unit.create!( :name => "Alamanda", :guid => 0x020000000032BB59 )
    phaedra      = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    resurrection = Spell.create!( :name => "Resurrection", :spell_id => 48171, :school => 0x2 )
    
    line = '7/2 20:31:45.787  SPELL_RESURRECT,0x020000000032BB59,"Alamanda",0x512,0x0200000000322CF9,"Phaedra",0x511,48171,"Resurrection",0x2'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellResurrectEvent"
    event.offset.should == BigDecimal( '45.787' )
    event.source.should == alamanda
    event.destination.should == phaedra
    event.source_flags.should == 0x512
    event.destination_flags.should == 0x511
    
    event.spell.should == resurrection
  end
  
  it "should create a SPELL_STOLEN event from a SPELL_STOLEN line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:19:00' ) )

    phaedra       = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    evoker        = Unit.create!( :name => "Dark Rune Evoker", :guid => 0xF13000806E0188EB )
    spellsteal    = Spell.create!( :name => "Spellsteal", :spell_id => 30449, :school => 0x40 )
    runic_mending = Spell.create!( :name => "Runic Mending", :spell_id => 62328, :school => 8 )
    
    line = '7/2 20:19:38.575  SPELL_STOLEN,0x0200000000322CF9,"Phaedra",0x511,0xF13000806E0188EB,"Dark Rune Evoker",0x10a48,30449,"Spellsteal",0x40,62328,"Runic Mending",8,BUFF'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellStolenEvent"
    event.offset.should == BigDecimal( '38.575' )
    event.source.should == phaedra
    event.destination.should == evoker
    event.source_flags.should == 0x511
    event.destination_flags.should == 0x10a48
    
    event.spell.should == spellsteal
    
    event.extra_spell.should == runic_mending
    event.should be_buff
  end
  
  it "should create a SPELL_SUMMON event from a SPELL_SUMMON line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 19:56:00' ) )
    
    cusimanse   = Unit.create!( :name => "Cusimanse", :guid => 0x0200000000D8ACBF )
    totem       = Unit.create!( :name => "Earthbind Totem", :guid => 0xF130000A46014C64 )
    totem_spell = Spell.create!( :name => "Earthbind Totem", :spell_id => 2484, :school => 0x1 )
    
    line = '7/2 19:56:17.891  SPELL_SUMMON,0x0200000000D8ACBF,"Cusimanse",0x512,0xF130000A46014C64,"Earthbind Totem",0xa28,2484,"Earthbind Totem",0x1'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SpellSummonEvent"
    event.offset.should == BigDecimal( '17.891' )
    event.source.should == cusimanse
    event.destination.should == totem
    event.source_flags.should == 0x512
    event.destination_flags.should == 0xa28
    
    event.spell.should == totem_spell
  end
  
  it "should create a SWING_DAMAGE event from a SWING_DAMAGE line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:02:00' ) )

    mathom  = Unit.create!( :name => "Mathom", :guid => 0x020000000032D896 )
    ravager = Unit.create!( :name => "Rark Rune Ravager", :guid => 0xF1300083DB0101F8 )
    
    line = '7/2 20:02:17.892  SWING_DAMAGE,0x020000000032D896,"Mathom",0x514,0xF1300083DB0101F8,"Dark Rune Ravager",0x8010a48,672,0,1,0,0,0,nil,1,nil'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SwingDamageEvent"
    event.offset.should == BigDecimal( '17.892' )
    event.source.should == mathom
    event.destination.should == ravager
    event.source_flags.should == 0x514
    event.destination_flags.should == 0x8010a48
    
    event.amount.should == 672
    event.overkill.should == 0
    event.school.should == 1
    event.resisted.should == 0
    event.blocked.should == 0
    event.absorbed.should == 0
    event.should_not be_critical
    event.should be_glancing
    event.should_not be_crushing
  end
  
  it "should create a SWING_MISSED event from a SWING_MISSED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:02:00' ) )

    mathom  = Unit.create!( :name => "Mathom", :guid => 0x020000000032D896 )
    ravager = Unit.create!( :name => "Rark Rune Ravager", :guid => 0xF1300083DB0101F8 )
    dodge   = MissType.create!( :name => "DODGE" )
    
    line = '7/2 20:02:17.622  SWING_MISSED,0xF1300083DB0101F8,"Dark Rune Ravager",0x8010a48,0x020000000032D896,"Mathom",0x514,DODGE'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "SwingMissedEvent"
    event.offset.should == BigDecimal( '17.622' )
    event.source.should == ravager
    event.destination.should == mathom
    event.source_flags.should == 0x8010a48
    event.destination_flags.should == 0x514
    
    event.miss_type.should == dodge
    event.amount.should == 0
  end
  
  it "should create a UNIT_DIED event from a UNIT_DIED line" do
    @factory.raid = Raid.new( :time => Time.parse( '7/2 20:11:00' ) )

    phaedra       = Unit.create!( :name => "Phaedra", :guid => 0x0200000000322CF9 )
    
    line = '7/2 20:11:05.989  UNIT_DIED,0x0000000000000000,nil,0x80000000,0x0200000000322CF9,"Phaedra",0x511'
    
    @factory.reset_cache
    event = @factory.build( line )
    event.should_not be_nil
    
    event.class.name.should == "UnitDiedEvent"
    event.offset.should == BigDecimal( '5.989' )
    event.source.should be_nil
    event.destination.should == phaedra
    event.source_flags.should == 0x80000000
    event.destination_flags.should == 0x511
  end
end
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MapColumns do
  it "should add a map_columns class method when included" do
    class Foo
      include MapColumns
    end
    
    Foo.should be_respond_to( :map_column )
  end

  it "should add a map_boolean_columns class method when included" do
    class Foo
      include MapColumns
    end
    
    Foo.should be_respond_to( :map_boolean_column )
  end
  
  context "#map_column" do
    before( :each ) do
      class Foo
        include MapColumns
      
        map_column :new_column, :old_column
      end
    
      @object = Foo.new
    end
    
    it "should map a column to another one for reading using #read_attribute" do
      @object.should_receive( :read_attribute ).with( :old_column )
    
      @object.new_column
    end
  
    it "should map a column to another one for writing using #write_attribute" do
      value = 113
    
      @object.should_receive( :write_attribute ).with( :old_column, value )
    
      @object.new_column = value
    end
  end
  
  context "#map_column" do
    before( :each ) do
      class Foo
        include MapColumns
      
        map_boolean_column :new_column, :old_column
      end
    
      @object = Foo.new
    end
    
    it "should map a column to another one for reading using #read_attribute" do
      @object.should_receive( :read_attribute ).with( :old_column )
    
      @object.new_column?
    end
    
    it "should have the read method return true if the original column is 1" do
      @object.should_receive( :read_attribute ).with( :old_column ).and_return 1
      
      @object.new_column?.should be_true
    end
    
    it "should have the read method return true if the original column is not 1" do
      @object.should_receive( :read_attribute ).with( :old_column ).and_return 0
      
      @object.new_column?.should_not be_true
    end
  
    it "should map a column to another one for writing using #write_attribute" do
      value = 1
    
      @object.should_receive( :write_attribute ).with( :old_column, anything() )
    
      @object.new_column = value
    end
    
    it "should store 1 in the original column if the assigned value is true" do
      value = true
    
      @object.should_receive( :write_attribute ).with( :old_column, 1 )
    
      @object.new_column = value
    end
    
    it "should store 0 in the original column if the assigned value is not true" do
      value = false
    
      @object.should_receive( :write_attribute ).with( :old_column, 0 )
    
      @object.new_column = value
    end
  end
end

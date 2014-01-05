require 'spec_helper'

describe Binary do

  describe "known your sponsor" do
    it{should respond_to :sponsor}
    context "when root" do
      it "returns no sponsor" do
        root=Binary.new(sponsor_id:0)
        root.sponsor.should == nil
      end
    end
    context "when not root" do
      it "returns your sponsor" do
        root=Binary.new(sponsor_id:0)
        node1=Binary.new(sponsor:root)
        node1.sponsor.should == root
      end
    end
  end

  describe "known whom are its sponsored" do
    it{should respond_to :sponsored}
  end


end

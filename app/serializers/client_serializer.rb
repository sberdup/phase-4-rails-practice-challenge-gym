class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :membership_total

  # private 
  # Custom methods are inaccessible in serializers if you make them private. 
  # This does not appear to be an instance of something which is why [self] is used.
  
  def membership_total 
    mems = self.object.memberships
    mems.sum{|m| m.charge}
  end
end

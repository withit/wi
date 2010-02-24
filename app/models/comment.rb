class Comment < ActiveRecord::Base
  belongs_to :post
  
  STATES = %w(pending approved rejected)
  
  def initialize *args
    super
    self.state ||= self.class::STATES.first
  end
  
  STATES.each do |state|
    named_scope state.to_sym, :conditions => {:state => state}
  end
  
  named_scope :approved_or_authored, lambda { |authored_comment_ids|
    {:conditions => ["(state = ?) OR ((id IN (?)) AND (state = ?))", 'approved', authored_comment_ids, 'pending']}
  }
  
  def pending?
    state == 'pending'
  end
  
  def approve!
    update_attribute(:state, 'approved')
  end
  
  def reject!
    update_attribute(:state, 'rejected')
  end
end

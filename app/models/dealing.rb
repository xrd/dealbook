class Dealing < ActiveRecord::Base
  # attr_accessible :deal_id, :buyer_id, :buyer_type
  has_paper_trail

  # Associations
  belongs_to :deal
  belongs_to :buyer, :polymorphic => true
  belongs_to :investor, :class_name => 'Investor', :foreign_key => 'buyer_id'
  belongs_to :corporate, :class_name => 'Company', :foreign_key => 'buyer_id'

  # Validations
  # validates :deal, :uniqueness => { :scope => [ :buyer_id, :buyer_type ] } 
end

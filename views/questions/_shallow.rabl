attributes :id, :label, :created_at, :updated_at

child :answer => :answer do
  extends 'answers/_shallow'
end
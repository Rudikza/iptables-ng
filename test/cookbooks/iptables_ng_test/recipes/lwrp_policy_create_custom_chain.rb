iptables_ng_policy 'create-custom-chain' do
  table  'mangle'
  chin   'FOO'
  policy 'DROP [0:0]'
  action :create
end
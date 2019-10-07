require 'spec_helper'

describe 'iptables-ng::install' do
  context 'When all attributes are default, on Debian 10' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'debian', '10'

    it 'should remove ufw' do
      expect(chef_run).to remove_package('iptables-ng::install - ufw package')
    end
  end

  context 'When all attributes are default, on CentOS 7' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7') do |node|
        node.automatic.merge!(JSON.parse(File.read('test/nodes/test.json')))
      end.converge(described_recipe)
    end

    it 'should include iptables-ng::manage' do
      expect(chef_run).to include_recipe('iptables-ng::manage')
    end

    it 'should create directory for chains' do
      expect(chef_run).to create_directory('/etc/iptables.d/filter')
      expect(chef_run).to create_directory('/etc/iptables.d/nat')
      expect(chef_run).to create_directory('/etc/iptables.d/mangle')
      expect(chef_run).to create_directory('/etc/iptables.d/raw')
    end

    it 'should apply default policies' do
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-filter-INPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-filter-OUTPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-filter-FORWARD')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-nat-OUTPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-nat-PREROUTING')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-nat-POSTROUTING')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-INPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-OUTPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-FORWARD')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-PREROUTING')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-POSTROUTING')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-raw-OUTPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-raw-PREROUTING')
    end
  end

  context 'When all attributes are default, on Debian 10' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '10') do |node|
        node.automatic.merge!(JSON.parse(File.read('test/nodes/test.json')))
      end.converge(described_recipe)
    end

    it 'should include iptables-ng::manage' do
      expect(chef_run).to include_recipe('iptables-ng::manage')
    end

    it 'should create directory for chains' do
      expect(chef_run).to create_directory('/etc/iptables.d/filter')
      expect(chef_run).to create_directory('/etc/iptables.d/nat')
      expect(chef_run).to create_directory('/etc/iptables.d/mangle')
      expect(chef_run).to create_directory('/etc/iptables.d/raw')
    end

    it 'should apply default policies' do
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-filter-INPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-filter-OUTPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-filter-FORWARD')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-nat-OUTPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-nat-PREROUTING')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-nat-POSTROUTING')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-INPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-OUTPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-FORWARD')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-PREROUTING')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-mangle-POSTROUTING')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-raw-OUTPUT')
      expect(chef_run).to create_if_missing_iptables_ng_chain('default-policy-raw-PREROUTING')
    end
  end
end

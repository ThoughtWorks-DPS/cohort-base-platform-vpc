
require 'awspec'
require 'json'

tfvars = JSON.parse(File.read('./' + ENV['TEST_ENV'] + '.auto.tfvars.json'))

describe vpc(tfvars["cluster_name"] + '-vpc') do
  it { should exist }
  its(:cidr_block) { should eq tfvars['vpc_cidr'] }
  it { should have_vpc_attribute('enableDnsHostnames') }
  it { should have_vpc_attribute('enableDnsSupport') }
  it { should have_tag('cluster').value(tfvars['cluster_name']) }
  it { should have_tag('kubernetes.io/cluster/'+tfvars["cluster_name"]).value('shared') }
  it { should have_tag('pipeline').value('cohort-base-platform-vpc') }
end

tfvars['vpc_azs'].each_with_index do |az, index|
  describe subnet(tfvars['cluster_name'] + '-vpc-public-subnet-' + az) do
    it { should exist }
    its(:cidr_block) { should eq tfvars['vpc_public_subnets'][index] }
    it { should have_tag('Tier').value('public') }
    it { should have_tag('kubernetes.io/role/elb').value('1') }
  end

  describe subnet(tfvars['cluster_name'] + '-vpc-private-subnet-' + az) do
    it { should exist }
    its(:cidr_block) { should eq tfvars['vpc_private_subnets'][index] }
    it { should have_tag('Tier').value('private') }
    it { should have_tag('kubernetes.io/role/internal-elb').value('1') }
  end

  describe subnet(tfvars['cluster_name'] + '-vpc-intra-subnet-' + az) do
    it { should exist }
    its(:cidr_block) { should eq tfvars['vpc_intra_subnets'][index] }
    it { should have_tag('Tier').value('intra') }
  end
end

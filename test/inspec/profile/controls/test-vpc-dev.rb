dev_vpc_id = input('dev-vpc-id')
dev_vpc_cidr = input('dev-vpc-cidr')

control "dev-vpc" do
    describe "dev VPC should meet that" do
        describe aws_vpc(dev_vpc_id) do
            it { should exist }
            it { should_not be_default }
            its('cidr_block') { should cmp dev_vpc_cidr}
            its('state') { should eq 'available' }
        end
    end
end

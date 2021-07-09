test_vpc_id = input('test-vpc-id')
test_vpc_cidr = input('test-vpc-cidr')

control "test-vpc" do
    describe "test VPC should meet that" do
        describe aws_vpc(test_vpc_id) do
            it { should exist }
            it { should_not be_default }
            its('cidr_block') { should cmp test_vpc_cidr}
            its('state') { should eq 'available' }
        end
    end
end

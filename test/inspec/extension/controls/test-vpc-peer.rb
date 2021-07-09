dev_vpc_id = input('dev-vpc-id')
test_vpc_id = input('test-vpc-id')
peer_id = input('peer-id')

profile = ENV["AWS_PROFILE"]
region = ENV["AWS_DEFAULT_REGION"]
command = "./extension/scripts/describe-vpc-peer.sh"

control "vpc peering" do
    describe "Peer should exist" do
        describe bash("#{command} -p #{profile} -r #{region} -i #{peer_id} -a State -v Active") do
            its('stderr') { should eq '' }
            its('exit_status') { should eq 0 }
        end
    end
    describe "Accepter should be test VPC #{test_vpc_id}" do
        describe bash("#{command} -p #{profile} -r #{region} -i #{peer_id} -a AccepterVpc -v #{test_vpc_id}") do
            its('stderr') { should eq '' }
            its('exit_status') { should eq 0 }
        end
    end
    describe "Requester should be dev VPC #{dev_vpc_id}" do
        describe bash("#{command} -p #{profile} -r #{region} -i #{peer_id} -a RequesterVpc -v #{dev_vpc_id}") do
            its('stderr') { should eq '' }
            its('exit_status') { should eq 0 }
        end
    end
end

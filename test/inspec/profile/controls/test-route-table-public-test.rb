vpc_id = input("test-vpc-id")
route_table_id = input('test-public-route-table-id')

control "test-public-route-table" do
    describe "test public route table should meet that" do
        describe aws_route_table(route_table_id: route_table_id) do
            it { should exist }
        end
    end
end

vpc_id = input("dev-vpc-id")
route_table_id = input('dev-public-route-table-id')

control "dev-public-route-table" do
    describe "dev public route table should meet that" do
        describe aws_route_table(route_table_id: route_table_id) do
            it { should exist }
        end
    end
end

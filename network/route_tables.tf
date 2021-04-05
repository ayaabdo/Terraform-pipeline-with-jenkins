resource "aws_route_table" "public" {
    vpc_id = aws_vpc.iti.id
    tags = {
        Name = "public"
    }
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.iti.id
    tags = {
        Name = "private"
    }
}

resource "aws_route" "public" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iti.id
}

resource "aws_route" "private" {
    route_table_id = aws_route_table.private.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.iti.id
}

resource "aws_route_table_association" "public1" {
    route_table_id = aws_route_table.public.id
    subnet_id = aws_subnet.public1.id
}

resource "aws_route_table_association" "public2" {
    route_table_id = aws_route_table.public.id
    subnet_id = aws_subnet.public2.id
}

resource "aws_route_table_association" "private1" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private1.id
}

resource "aws_route_table_association" "private2" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private2.id
}

resource "aws_vpc" "base_vpc" {
  count = length(var.envs)

  cidr_block = "10.${count.index}.0.0/16"

  tags = {
    Name = join("-", [var.name, var.envs[count.index]])
  }
}

resource "aws_subnet" "private_subnet_1a" {
  count = length(var.envs)

  vpc_id                  = aws_vpc.base_vpc[count.index].id
  cidr_block              = "10.${count.index}.1.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.name}-private-1a"
    tier = "private"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  count = length(var.envs)

  vpc_id                  = aws_vpc.base_vpc[count.index].id
  cidr_block              = "10.${count.index}.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}b"

  tags = {
    Name = "${var.name}-private-1b"
    tier = "private"
  }
}



resource "aws_subnet" "public_subnet_1a" {
  count = length(var.envs)

  vpc_id                  = aws_vpc.base_vpc[count.index].id
  cidr_block              = "10.${count.index}.100.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.name}-public-1a"
    tier = "public"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  count = length(var.envs)

  vpc_id                  = aws_vpc.base_vpc[count.index].id
  cidr_block              = "10.${count.index}.101.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.name}-public-1b"
    tier = "public"
  }
}

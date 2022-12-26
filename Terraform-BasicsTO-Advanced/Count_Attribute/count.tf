resource "aws_iam_user" "user" {
    name = "user.${count.index}"
    count = 5
    path = "/system/"
}

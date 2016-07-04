node default {
  include ::users
  include ::homedir
#  include ::convenience
  include ::allpackages
  include ::perfmon
  include ::services
  include ::grub
  include ::mysql
}

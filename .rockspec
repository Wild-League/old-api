package = "wild-league-api"
version = "1.0.0"

source = {
  url = "git@github.com:Wild-League/api.git"
}

description = {
  summary = "Wild League API and implementation for wild league",
  homepage = "https://github.com/Wild-League/api",
  license = "MIT"
}

dependencies = {
	"lua ~> 5.1",
	lapis = '1.14.0-1',
	bcrypt = '2.3-1',
	lua-resty-jwt = '0.2.3-0',
	luabitop = '1.0.2-3'
}

build = {
  type = "none"
}

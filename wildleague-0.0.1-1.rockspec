package = "wildleague"
version = "0.0.1-1"

source = {
  url = "git+https://github.com/Wild-League/api.git"
}

description = {
  summary = "Wild League API and implementation for wild league",
  homepage = "https://github.com/Wild-League/api",
  license = "MIT"
}

dependencies = {
	"pgmoon = 1.13.0-1",
	"bcrypt = 2.3-1",
	"lua-resty-openssl = 0.8.24-1",
	"luabitop = 2.1.0-beta3-1",
	"lua-resty-jwt = 0.2.3-0",
	"lapis = 1.14.0-1",
	"luasec = 1.3.2-1"
}

build = {
	type = "none"
}

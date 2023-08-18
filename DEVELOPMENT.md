# Development Instructions

# Lua
you should have lua = 5.1

# Install deps
`luarocks build --deps-mode=one .rockspec`

##########
# Lapis (framework)
Install using luarocks. On MAC, it's better to follow [this steps](https://gist.github.com/edgarberlinck/c50f4db6d09f6493b1c205a91c2a0264).

`$ luarocks install lapis`

> Note: if there is an error: `Could not find header file for CRYPTO`, read [this](https://github.com/leafo/lapis/issues/632).


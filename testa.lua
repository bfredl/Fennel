fennel = loadfile("fennel.lua")()

function fennel_reader(str)
  local status, res = pcall(fennel.compileString, str)
  if not status then
    return nil, res
  end
  require'luadev'.print(res)
  return loadstring(res, str)
end
luadev = require'luadev'

runner = fennel.scopetest({})
function reader(str)
  local res, err, errsrc = runner(str)
  if not res then
    print(errsrc)
    return nil, err
  end
  print(err)
  return res
end
luadev.reader = reader
if false then
runner("(tostring `(+ 2 2))")()
runner("(list? `(+ 2))")()
runner("(list? `(+ 2))")()
end

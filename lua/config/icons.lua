local _M = {}

_M.diagnostics = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " ",
}

_M.kind = {
  Class       = " ",
  Color       = " ",
  Constant    = " ",
  Constructor = " ",
  Enum        = " ",
  EnumMember  = " ",
  Field       = "󰄶 ",
  File        = " ",
  Folder      = " ",
  Function    = " ",
  Interface   = "󰜰",
  Keyword     = "󰌆 ",
  Method      = "ƒ ",
  Module      = "󰏗 ",
  Property    = " ",
  Snippet     = "󰘍 ",
  Struct      = " ",
  Text        = " ",
  Unit        = " ",
  Value       = "󰎠 ",
  Variable    = " ",
}

return _M

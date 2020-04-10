local lib = simple_chat
local mn = lib.modname
--[[
   ****************************************************************
   *******        Function split(parameter)                  ******
   ****************************************************************
    Split Command and Parameter and write it to a table
--]]
function lib.split(parameter)
        local cmd = {}
        for word in string.gmatch(parameter, "[%w%-%:%.2f%_]+") do
            table.insert(cmd, word)

        end -- for word

        return cmd

end -- function lib.split

--[[
   ****************************************************************
   *******        Function check(command)                    ******
   ****************************************************************
    Check if the command is valid
--]]
function lib.check(player, cmd)

        if(cmd ~= nil and cmd[1] ~= nil) then
            if(lib[cmd[1]] ~= nil) then
                -- Command is valid, execute it with parameter
                lib[cmd[1]](player, cmd)

            else -- A command is given, but
            -- Command not found, report it.
                if(cmd[1] ~= nil) then
                    lib.print(player, lib.red .. mn ..": Unknown Command \"" ..
                                    lib.orange .. cmd[1] .. lib.red .. "\".")

                else
                    if(lib["help"]) then
                        lib["help"](player, cmd)

                    else
                        lib.print(player, lib.red .. "Unknown Command. No helpsystem available.")

                    end --if(distancer["help"]

                end -- if(cmd[1]

            end -- if(distancer[cmd[1

        else
            lib.print(player, lib.red .. "No Command for " .. mn .. " given.")
            lib.print(player, lib.red .. "Try /c help.")

        end -- if(not cmd)

end -- function lib.check(cmd

--[[
   ****************************************************************
   *******         Function register_help()                  ******
   ****************************************************************
    Registers a new Entry in the Helpsystem for an Command.
]]--
function lib.register_help(entry)

    lib.helpsystem[entry.Name] = {
                                Name = entry.Name,
                                Usage = entry.Usage,
                                Description = entry.Description,
                                Parameter = entry.Parameter
                            }

end

--[[
   ****************************************************************
   *******     Function display_chat_message(message)        ******
   ****************************************************************
]]--

function lib.print(player, text)
    local lprint = minetest.chat_send_player
    local playername = minetest.get_player_by_name(player)
    lprint(player, text)

end -- function distancer.print(

--[[
   ****************************************************************
   *******         Function show_version()                   ******
   ****************************************************************
]]--
function lib.show_version()
    print("[MOD]" .. lib.modname .. " v " .. lib.version .. "." .. lib.revision .. " loaded. \n")

end -- lib.show_version

	-- function action_increase_power(e)
actions.action_increase_power = function(e)
	e = shared["incomming_event"]
	------------------------------------------------
	-- TODO: Complete this with your action code. --
	------------------------------------------------
end

	-- function action_decrease_power(e)
actions.action_decrease_power = function(e)
	e = shared["incomming_event"]
	------------------------------------------------
	-- TODO: Complete this with your action code. --
	--
	local levels = getDomain('power')
  local retMax = -100
  local l
  for _,lp in ipairs(levels) do
    local ret = functions.action_ip(lp)
    if ret > retMax then
      retMax = ret
      l = lp
    end
  end
  return notifs.change_power(l,e)

	------------------------------------------------
end

	-- function event_NClientsConnectedHigh(e)
events.event_NClientsConnectedHigh = function(e) 
	shared["incomming_event"] = e
	-----------------------------------------------
	-- TODO: Complete this with your event code. --
	-----------------------------------------------
end

	-- function event_NClientsConnectedLow(e)
events.event_NClientsConnectedLow = function(e) 
	shared["incomming_event"] = e
	-----------------------------------------------
	-- TODO: Complete this with your event code. --
	-----------------------------------------------
end


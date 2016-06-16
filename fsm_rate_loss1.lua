print ("FSM loading...")

local function FSM(t)
	local a = {}
	for _,v in ipairs(t) do
		local old, t_function, new, actions = v[1], v[2], v[3], v[4]
    
    if a[old] == nil then a[old] = {} end
    if new then
      table.insert(a[old],{new = new, actions = actions, t_function = t_function})
    end    
  end
  return a
end


--auxiliar functions to be used when detecting happening events
local function register_as_happening(event)
  happening_events[event]=true
end
local function unregister_as_happening(event)
  happening_events[event]=nil
end
local function unregister_as_happening_f(filter)
	for event, _ in pairs(happening_events) do
		local matches = true
		for key, value in pairs(filter) do
			if not event[key]==value then
				matches=false
				break
			end
		end
		if matches then
			happening_events[event]=nil
		end
	end	
end


local shared = {}

--begin generated code
--------------------------------------------------------------------------


--initialization
local initialization_notifs = {
}
local initialization_subs = {
}

-------------------------------

-- Non-Generated functions ----

-- Obtained from:          ----

-- fsm_rate_loss1_manual.lua  --

-------------------------------
	-- function action_kr(e)
actions.action_kr = function(e)
	local levels = getDomain('rate')
	local retMax = -100
	local l
	for _,lr in ipairs(levels) do
		local ret = functions.action_kr(lr)
		if ret > retMax then
			retMax = ret
			l = lr
		end
	end
	return notifs.change_rate(l,e)
end
	-- Membership function for action_kr
functions.action_kr = function(l)
	------------------------------------------------
	-- TODO: Complete this with your function code. --
	------------------------------------------------
end

	-- function action_ip(e)
actions.action_ip = function(e)
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
end

	-- Membership function for action_ip
functions.action_ip = function(l)
	------------------------------------------------
	-- TODO: Complete this with your function code. --
	------------------------------------------------
end

	-- function action_ir(e)
actions.action_ir = function(e)
	local levels = getDomain('rate')
	local retMax = -100
	local l
	for _,lr in ipairs(levels) do
		local ret = functions.action_ir(lr)
		if ret > retMax then
			retMax = ret
			l = lr
		end
	end
	return notifs.change_rate(l,e)
end
	-- Membership function for action_ir
functions.action_ir = function(l)
	------------------------------------------------
	-- TODO: Complete this with your function code. --
	------------------------------------------------
end

	-- function action_dr(e)
actions.action_dr = function(e)
	local levels = getDomain('rate')
	local retMax = -100
	local l
	for _,lr in ipairs(levels) do
		local ret = functions.action_dr(lr)
		if ret > retMax then
			retMax = ret
			l = lr
		end
	end
	return notifs.change_rate(l,e)
end
	-- Membership function for action_dr
functions.action_dr = function(l)
	------------------------------------------------
	-- TODO: Complete this with your function code. --
	------------------------------------------------
end

	-- function action_kp(e)
actions.action_kp = function(e)
	local levels = getDomain('power')
	local retMax = -100
	local l
	for _,lp in ipairs(levels) do
		local ret = functions.action_kp(lp)
		if ret > retMax then
			retMax = ret
			l = lp
		end
	end
	return notifs.change_power(l,e)
end

	-- Membership function for action_kp
functions.action_kp = function(l)
	------------------------------------------------
	-- TODO: Complete this with your function code. --
	------------------------------------------------
end

	-- function event_ll(e)
events.event_ll = function(e) 
	shared["incomming_event"] = e
	-----------------------------------------------
	-- TODO: Complete this with your event code. --
	-----------------------------------------------
end

	-- function event_hl(e)
events.event_hl = function(e) 
	shared["incomming_event"] = e
	-----------------------------------------------
	-- TODO: Complete this with your event code. --
	-----------------------------------------------
end

	-- function event_lp(e)
events.event_lp = function(e) 
	shared["incomming_event"] = e
	-----------------------------------------------
	-- TODO: Complete this with your event code. --
	-----------------------------------------------
end

	-- function event_hp(e)
events.event_hp = function(e) 
	shared["incomming_event"] = e
	-----------------------------------------------
	-- TODO: Complete this with your event code. --
	-----------------------------------------------
end


-------------------------------

-- End of functions        ----

-------------------------------

local init_state="221"
--shares
local shared_0 = {}

--events
-----------------------------------------------
--          BEGIN COMPOSITE EVENTS           --
-----------------------------------------------
-- ¬hl
events.f0 = function(e) 
	local nonneg = events.event_hl(e)
	return 1-nonneg
end
-- ¬lp
events.f1 = function(e) 
	local nonneg = events.event_lp(e)
	return 1-nonneg
end
-- ¬ll
events.f2 = function(e) 
	local nonneg = events.event_ll(e)
	return 1-nonneg
end
-- ¬hp
events.f3 = function(e) 
	local nonneg = events.event_hp(e)
	return 1-nonneg
end
-----------------------------------------------
--           END COMPOSITE EVENTS            --
-----------------------------------------------

--actions
-----------------------------------------------
--          BEGIN COMPOSITE ACTIONS          --
-----------------------------------------------
-----------------------------------------------
--           END COMPOSITE ACTIONS           --
-----------------------------------------------

--transitions
local fsm = FSM{
  {"196", events.f2, "196", nil},
  {"196", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"197", events.f1, "210", nil},
  {"197", events.f0, "203", nil},
  {"197", events.f1, "213", nil},
  {"197", events.f0, "208", nil},
  {"197", events.event_hl, "209", nil},
  {"197", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"197", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"197", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"197", events.f2, "196", nil},
  {"197", events.f3, "214", nil},
  {"197", events.event_lp, "205", nil},
  {"197", events.f2, "201", nil},
  {"197", events.f3, "216", nil},
  {"197", events.f2, "198", nil},
  {"197", events.event_hp, "217", nil},
  {"197", events.event_hl, "219", nil},
  {"197", events.event_hp, "215", nil},
  {"197", events.event_lp, "211", nil},
  {"198", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"198", events.f2, "198", nil},
  {"199", events.f1, "210", nil},
  {"199", events.f0, "203", nil},
  {"199", events.f1, "213", nil},
  {"199", events.f0, "208", nil},
  {"199", events.event_hl, "209", nil},
  {"199", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"199", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"199", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"199", events.f2, "196", nil},
  {"199", events.f3, "214", nil},
  {"199", events.event_lp, "205", nil},
  {"199", events.f2, "201", nil},
  {"199", events.f3, "216", nil},
  {"199", events.f2, "198", nil},
  {"199", events.event_hp, "217", nil},
  {"199", events.event_hl, "219", nil},
  {"199", events.event_hp, "215", nil},
  {"199", events.event_lp, "211", nil},
  {"200", events.f1, "210", nil},
  {"200", events.f0, "203", nil},
  {"200", events.f1, "213", nil},
  {"200", events.f0, "208", nil},
  {"200", events.event_hl, "209", nil},
  {"200", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"200", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"200", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"200", events.f2, "196", nil},
  {"200", events.f3, "214", nil},
  {"200", events.event_lp, "205", nil},
  {"200", events.f2, "201", nil},
  {"200", events.f3, "216", nil},
  {"200", events.f2, "198", nil},
  {"200", events.event_hp, "217", nil},
  {"200", events.event_hl, "219", nil},
  {"200", events.event_hp, "215", nil},
  {"200", events.event_lp, "211", nil},
  {"201", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"201", events.f2, "201", nil},
  {"202", events.f1, "210", nil},
  {"202", events.f0, "203", nil},
  {"202", events.f1, "213", nil},
  {"202", events.f0, "208", nil},
  {"202", events.event_hl, "209", nil},
  {"202", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"202", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"202", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"202", events.f2, "196", nil},
  {"202", events.f3, "214", nil},
  {"202", events.event_lp, "205", nil},
  {"202", events.f2, "201", nil},
  {"202", events.f3, "216", nil},
  {"202", events.f2, "198", nil},
  {"202", events.event_hp, "217", nil},
  {"202", events.event_hl, "219", nil},
  {"202", events.event_hp, "215", nil},
  {"202", events.event_lp, "211", nil},
  {"203", events.f0, "203", nil},
  {"203", events.event_hl, "219", nil},
  {"204", events.f1, "210", nil},
  {"204", events.f0, "203", nil},
  {"204", events.f1, "213", nil},
  {"204", events.f0, "208", nil},
  {"204", events.event_hl, "209", nil},
  {"204", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"204", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"204", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"204", events.f2, "196", nil},
  {"204", events.f3, "214", nil},
  {"204", events.event_lp, "205", nil},
  {"204", events.f2, "201", nil},
  {"204", events.f3, "216", nil},
  {"204", events.f2, "198", nil},
  {"204", events.event_hp, "217", nil},
  {"204", events.event_hl, "219", nil},
  {"204", events.event_hp, "215", nil},
  {"204", events.event_lp, "211", nil},
  {"205", events.event_hl, "206", {actions.action_kr, actions.action_ip, }},
  {"205", events.f0, "205", nil},
  {"206", events.f1, "210", nil},
  {"206", events.f0, "203", nil},
  {"206", events.f1, "213", nil},
  {"206", events.f0, "208", nil},
  {"206", events.event_hl, "209", nil},
  {"206", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"206", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"206", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"206", events.f2, "196", nil},
  {"206", events.f3, "214", nil},
  {"206", events.event_lp, "205", nil},
  {"206", events.f2, "201", nil},
  {"206", events.f3, "216", nil},
  {"206", events.f2, "198", nil},
  {"206", events.event_hp, "217", nil},
  {"206", events.event_hl, "219", nil},
  {"206", events.event_hp, "215", nil},
  {"206", events.event_lp, "211", nil},
  {"207", events.f1, "210", nil},
  {"207", events.f0, "203", nil},
  {"207", events.f1, "213", nil},
  {"207", events.f0, "208", nil},
  {"207", events.event_hl, "209", nil},
  {"207", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"207", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"207", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"207", events.f2, "196", nil},
  {"207", events.f3, "214", nil},
  {"207", events.event_lp, "205", nil},
  {"207", events.f2, "201", nil},
  {"207", events.f3, "216", nil},
  {"207", events.f2, "198", nil},
  {"207", events.event_hp, "217", nil},
  {"207", events.event_hl, "219", nil},
  {"207", events.event_hp, "215", nil},
  {"207", events.event_lp, "211", nil},
  {"208", events.f0, "208", nil},
  {"208", events.event_hl, "209", nil},
  {"209", events.f1, "209", nil},
  {"209", events.event_lp, "207", {actions.action_kr, actions.action_ip, }},
  {"210", events.event_lp, "211", nil},
  {"210", events.f1, "210", nil},
  {"211", events.f0, "211", nil},
  {"211", events.event_hl, "212", {actions.action_kr, actions.action_ip, }},
  {"212", events.f1, "210", nil},
  {"212", events.f0, "203", nil},
  {"212", events.f1, "213", nil},
  {"212", events.f0, "208", nil},
  {"212", events.event_hl, "209", nil},
  {"212", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"212", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"212", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"212", events.f2, "196", nil},
  {"212", events.f3, "214", nil},
  {"212", events.event_lp, "205", nil},
  {"212", events.f2, "201", nil},
  {"212", events.f3, "216", nil},
  {"212", events.f2, "198", nil},
  {"212", events.event_hp, "217", nil},
  {"212", events.event_hl, "219", nil},
  {"212", events.event_hp, "215", nil},
  {"212", events.event_lp, "211", nil},
  {"213", events.f1, "213", nil},
  {"213", events.event_lp, "205", nil},
  {"214", events.f3, "214", nil},
  {"214", events.event_hp, "215", nil},
  {"215", events.f0, "215", nil},
  {"215", events.event_hl, "204", {actions.action_dr, actions.action_kp, }},
  {"216", events.event_hp, "217", nil},
  {"216", events.f3, "216", nil},
  {"217", events.event_hl, "218", {actions.action_dr, actions.action_kp, }},
  {"217", events.f0, "217", nil},
  {"218", events.f1, "210", nil},
  {"218", events.f0, "203", nil},
  {"218", events.f1, "213", nil},
  {"218", events.f0, "208", nil},
  {"218", events.event_hl, "209", nil},
  {"218", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"218", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"218", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"218", events.f2, "196", nil},
  {"218", events.f3, "214", nil},
  {"218", events.event_lp, "205", nil},
  {"218", events.f2, "201", nil},
  {"218", events.f3, "216", nil},
  {"218", events.f2, "198", nil},
  {"218", events.event_hp, "217", nil},
  {"218", events.event_hl, "219", nil},
  {"218", events.event_hp, "215", nil},
  {"218", events.event_lp, "211", nil},
  {"219", events.f3, "219", nil},
  {"219", events.event_hp, "202", {actions.action_dr, actions.action_kp, }},
  {"221", events.f1, "210", nil},
  {"221", events.f0, "203", nil},
  {"221", events.f1, "213", nil},
  {"221", events.f0, "208", nil},
  {"221", events.event_hl, "209", nil},
  {"221", events.event_ll, "200", {actions.action_ir, actions.action_kp, }},
  {"221", events.event_ll, "199", {actions.action_ir, actions.action_kp, }},
  {"221", events.event_ll, "197", {actions.action_ir, actions.action_kp, }},
  {"221", events.f2, "196", nil},
  {"221", events.f3, "214", nil},
  {"221", events.event_lp, "205", nil},
  {"221", events.f2, "201", nil},
  {"221", events.f3, "216", nil},
  {"221", events.f2, "198", nil},
  {"221", events.event_hp, "217", nil},
  {"221", events.event_hl, "219", nil},
  {"221", events.event_hp, "215", nil},
  {"221", events.event_lp, "211", nil},
}

--final states
local is_accept =   {
['197']=true,
['199']=true,
['200']=true,
['202']=true,
['204']=true,
['206']=true,
['207']=true,
['212']=true,
['218']=true,
['221']=true,
}


--------------------------------------------------------------------------
--end generated code

local current_state=init_state --current state
local i_event=1 --current event in window

function initialize()
 	print("FSM: initializing")
	return initialization_subs or {}, initialization_notifs or {}
end

local function dump_window()
	local s="=> "
	for _,e in ipairs(window) do
		if e.event.message_type=="trap" then
			s=s .. tostring(e.event.mib) ..","
		else
			s=s .. "#,"
		end
	end
	return s
end

--advances the machine a single step.
--returns nil if arrives at the end the window, or the event is not recognized
--otherwise, returns the resulting list from the action
local function fst_step()
	local event_reg = window[i_event]
	if not event_reg then return end --window finished
	local event=event_reg.event
			
	local state=fsm[current_state]
  assert(#state>0)
	--search first transition that verifies e
	local best_tf=-1
	local transition
	for _, l in ipairs(state) do
    local tf=l.t_function(event)
    if best_tf<tf then
      best_tf=tf
      transition=l
    end
	end 
  assert(transition)
	
	local ret_call = {}
	if transition.actions then
    for _, action in ipairs(transition.actions) do
      local ret_action = action(event)
      for _, v in ipairs(ret_action) do ret_call[#ret_call+1] = v end
    end
  end
  
	i_event=i_event+1
	current_state = transition.new
	print ("NEW STATE:", current_state, "#TRANS:", #fsm[current_state],  "#RETS:", #ret_call, "ACCEPT:", is_accept[current_state], "FINAL:", #fsm[current_state]==0)
  return ret_call, is_accept[current_state], #fsm[current_state]==0
end

function step()
	print("FSM: WINDOW STEP ", #window, dump_window())
	
	local ret, accept, final = {}, false, false
  
  repeat
    local ret_step
		ret_step, accept, final = fst_step()
		if ret_step then 
			for _, r in ipairs(ret_step) do ret[#ret+1]=r	end --queue generated actions
		end
  until accept or i_event>#window
  assert(not (final and not accept))
  
  if accept then
    --purge consumed events from window
    print("Purge consumed events", #window)
    local i=1
    local e = window[i_event]
    repeat
      if happening_events[window[i]] then
        i=i+1
      else
        table.remove(window, i)
        i_event=i_event-1
      end
    until window[i]==e
    if not happening_events[window[i]] then table.remove(window, i) end
    print("Purge consumed events", #window)
  end
  
	if #ret>0 then
		print ("FSM: WINDOW STEP generating output ", #ret, accept, final, current_state)
	end
	return ret, accept, final
end

function reset()
  current_state=init_state 
  i_event=1 
  happening_events={}
  print ("FSM: RESET")
end

print ("FSM loaded.")


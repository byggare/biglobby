function MenuComponentManager:create_contract_gui()
	local num_player_slots = BigLobbyGlobals:num_player_slots()

	self:close_contract_gui()
	self._contract_gui = ContractBoxGui:new(self._ws, self._fullscreen_ws)
	local peers_state = managers.menu:get_all_peers_state() or {}
	for i = 1, num_player_slots do
		self._contract_gui:update_character_menu_state(i, peers_state[i])
	end
end
function MenuComponentManager:show_contract_character(state)
	local num_player_slots = BigLobbyGlobals:num_player_slots()

	if self._contract_gui then
		for i = 1, num_player_slots do
			self._contract_gui:set_character_panel_alpha(i, state and 1 or 0.4)
		end
	end
end
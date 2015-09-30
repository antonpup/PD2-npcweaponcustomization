if not _G.NPCWeap then
    _G.NPCWeap = {}
    NPCWeap.debug_enabled = true
    NPCWeap.debug_systemprint = true
    NPCWeap.loaded_options = NPCWeap.loaded_options or {}
    NPCWeap.mod_path = ModPath
    NPCWeap.save_path = SavePath
    NPCWeap.menu_name = "NPCWeap_menu"
    NPCWeap.OptionMenuName = "NPCWeapOptionsMenu"
    NPCWeap.write_options = NPCWeap.write_options or {}
    NPCWeap.loaded_options = NPCWeap.loaded_options or {}
    NPCWeap.weapons = NPCWeap.weapons or {}
    NPCWeap.incompat_categories_button = {}
    NPCWeap.currentUnit = nil
    
end

NPCWeap.dofiles = {
    "Options.lua"
}

NPCWeap.hook_files = {
    ["lib/units/weapons/npcraycastweaponbase"] = "NPCWeaponBase.lua"
}

NPCWeap.PrevTypes = {
    [1] = {name = "npcweap_weapon"},
    [2] = {name = "npcweap_ene_bulldozer_1_husk", unit = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1_husk"},
    
    [3] = {name = "npcweap_ene_cop_1_husk", unit = "units/payday2/characters/ene_cop_1/ene_cop_1_husk"},
    [4] = {name = "npcweap_ene_cop_2_husk", unit = "units/payday2/characters/ene_cop_2/ene_cop_2_husk"},
    [5] = {name = "npcweap_ene_cop_3_husk", unit = "units/payday2/characters/ene_cop_3/ene_cop_3_husk"},
    [6] = {name = "npcweap_ene_cop_4_husk", unit = "units/payday2/characters/ene_cop_4/ene_cop_4_husk"},
    [7] = {name = "npcweap_ene_security_1_husk", unit = "units/payday2/characters/ene_security_1/ene_security_1_husk", require_package = "packages/narr_firestarter3"},
    [8] = {name = "npcweap_ene_security_2_husk", unit = "units/payday2/characters/ene_security_2/ene_security_2_husk", require_package = "packages/narr_firestarter3"},
    [9] = {name = "npcweap_ene_security_3_husk", unit = "units/payday2/characters/ene_security_3/ene_security_3_husk", require_package = "packages/narr_firestarter3"},
    [10] = {name = "npcweap_ene_security_4_husk", unit = "units/payday2/characters/ene_security_4/ene_security_4_husk", require_package = "packages/narr_big"},
    [11] = {name = "npcweap_ene_security_5_husk", unit = "units/payday2/characters/ene_security_5/ene_security_5_husk", require_package = "packages/narr_big"},
    [12] = {name = "npcweap_ene_security_6_husk", unit = "units/payday2/characters/ene_security_6/ene_security_6_husk", require_package = "packages/narr_big"},
    [13] = {name = "npcweap_ene_security_7_husk", unit = "units/payday2/characters/ene_security_7/ene_security_7_husk", require_package = "packages/narr_big"},
    [14] = {name = "npcweap_ene_city_swat_1_husk", unit = "units/payday2/characters/ene_city_swat_1/ene_city_swat_1_husk"},
    [15] = {name = "npcweap_ene_city_swat_2_husk", unit = "units/payday2/characters/ene_city_swat_2/ene_city_swat_2_husk"},
    [16] = {name = "npcweap_ene_city_swat_3_husk", unit = "units/payday2/characters/ene_city_swat_3/ene_city_swat_3_husk"},
    [17] = {name = "npcweap_ene_fbi_1_husk", unit = "units/payday2/characters/ene_fbi_1/ene_fbi_1_husk"},
    [18] = {name = "npcweap_ene_fbi_2_husk", unit = "units/payday2/characters/ene_fbi_2/ene_fbi_2_husk"},
    [19] = {name = "npcweap_ene_fbi_3_husk", unit = "units/payday2/characters/ene_fbi_3/ene_fbi_3_husk"},
    [20] = {name = "npcweap_ene_fbi_boss_1_husk", unit = "units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1_husk", require_package = "packages/narr_hox_2"},
    [21] = {name = "npcweap_ene_fbi_female_1_husk", unit = "units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1_husk", require_package = "packages/narr_hox_2"},
    [22] = {name = "npcweap_ene_fbi_female_2_husk", unit = "units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2_husk", require_package = "packages/narr_hox_2"},
    [23] = {name = "npcweap_ene_fbi_female_3_husk", unit = "units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3_husk", require_package = "packages/narr_hox_2"},
    [24] = {name = "npcweap_ene_fbi_female_4_husk", unit = "units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4_husk", require_package = "packages/narr_hox_2"},
    [25] = {name = "npcweap_ene_fbi_heavy_1_husk", unit = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"},
    [26] = {name = "npcweap_ene_fbi_office_1_husk", unit = "units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1_husk", require_package = "packages/narr_hox_2"},
    [27] = {name = "npcweap_ene_fbi_office_2_husk", unit = "units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2_husk", require_package = "packages/narr_hox_2"},
    [28] = {name = "npcweap_ene_fbi_office_3_husk", unit = "units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3_husk", require_package = "packages/narr_hox_2"},
    [29] = {name = "npcweap_ene_fbi_office_4_husk", unit = "units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4_husk", require_package = "packages/narr_hox_2"},
    [30] = {name = "npcweap_ene_fbi_swat_1_husk", unit = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk"},
    [31] = {name = "npcweap_ene_fbi_swat_2_husk", unit = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk"},
    [32] = {name = "npcweap_ene_murkywater_1_husk", unit = "units/payday2/characters/ene_murkywater_1/ene_murkywater_1_husk", require_package = "packages/kosugi"},
    [33] = {name = "npcweap_ene_murkywater_2_husk", unit = "units/payday2/characters/ene_murkywater_2/ene_murkywater_2_husk", require_package = "packages/kosugi"},
    [34] = {name = "npcweap_ene_prisonguard_female_1_husk", unit = "units/payday2/characters/ene_prisonguard_female_1/ene_prisonguard_female_1_husk", require_package = "packages/narr_hox_1"},
    [35] = {name = "npcweap_ene_prisonguard_male_1_husk", unit = "units/payday2/characters/ene_prisonguard_male_1/ene_prisonguard_male_1_husk", require_package = "packages/narr_hox_1"},
    [36] = {name = "npcweap_ene_secret_service_1_husk", unit = "units/payday2/characters/ene_secret_service_1/ene_secret_service_1_husk", require_package = "packages/kosugi"},
    [37] = {name = "npcweap_ene_secret_service_2_husk", unit = "units/payday2/characters/ene_secret_service_2/ene_secret_service_2_husk", require_package = "packages/kosugi"},
    [38] = {name = "npcweap_ene_shield_1_husk", unit = "units/payday2/characters/ene_shield_1/ene_shield_1_husk"},
    [39] = {name = "npcweap_ene_shield_2_husk", unit = "units/payday2/characters/ene_shield_2/ene_shield_2_husk"},
    [40] = {name = "npcweap_ene_sniper_1_husk", unit = "units/payday2/characters/ene_sniper_1/ene_sniper_1_husk"},
    [41] = {name = "npcweap_ene_sniper_2_husk", unit = "units/payday2/characters/ene_sniper_2/ene_sniper_2_husk"},
    [42] = {name = "npcweap_ene_spook_1_husk", unit = "units/payday2/characters/ene_spook_1/ene_spook_1_husk"},
    [43] = {name = "npcweap_ene_swat_1_husk", unit = "units/payday2/characters/ene_swat_1/ene_swat_1_husk"},
    [44] = {name = "npcweap_ene_swat_2_husk", unit = "units/payday2/characters/ene_swat_2/ene_swat_2_husk"},
    [45] = {name = "npcweap_ene_swat_heavy_1_husk", unit = "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk"},
    [46] = {name = "npcweap_ene_tazer_1_husk", unit = "units/payday2/characters/ene_tazer_1/ene_tazer_1_husk"},
    [47] = {name = "npcweap_ene_bulldozer_2_husk", unit = "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2_husk"},
    [48] = {name = "npcweap_ene_bulldozer_3_husk", unit = "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3_husk"},
    --[49] = {name = "npcweap_ene_bulldozer_4_husk", unit = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4_husk"},
    [50] = {name = "npcweap_ene_gang_mobster_boss_husk", unit = "units/payday2/characters/ene_gang_mobster_boss/ene_gang_mobster_boss_husk", require_package = "packages/narr_mia_2"},
    [51] = {name = "npcweap_ene_gang_russian_2_husk", unit = "units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2_husk", require_package = "packages/vlad_nightclub"},
    [52] = {name = "npcweap_ene_gang_russian_4_husk", unit = "units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4_husk", require_package = "packages/vlad_nightclub"},
    [53] = {name = "npcweap_ene_gang_russian_5_husk", unit = "units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5_husk", require_package = "packages/vlad_nightclub"},
    [54] = {name = "npcweap_ene_biker_1_husk", unit = "units/payday2/characters/ene_biker_1/ene_biker_1_husk", require_package = "packages/narr_jungle1"},
    [55] = {name = "npcweap_ene_biker_2_husk", unit = "units/payday2/characters/ene_biker_2/ene_biker_2_husk", require_package = "packages/narr_jungle1"},
    [56] = {name = "npcweap_ene_biker_3_husk", unit = "units/payday2/characters/ene_biker_3/ene_biker_3_husk", require_package = "packages/narr_jungle1"},
    [57] = {name = "npcweap_ene_biker_4_husk", unit = "units/payday2/characters/ene_biker_4/ene_biker_4_husk", require_package = "packages/narr_jungle1"},
    [58] = {name = "npcweap_ene_gang_black_1_husk", unit = "units/payday2/characters/ene_gang_black_1/ene_gang_black_1_husk", require_package = "packages/narr_jungle1"},
    [59] = {name = "npcweap_ene_gang_black_2_husk", unit = "units/payday2/characters/ene_gang_black_2/ene_gang_black_2_husk", require_package = "packages/narr_jungle1"},
    [60] = {name = "npcweap_ene_gang_black_3_husk", unit = "units/payday2/characters/ene_gang_black_3/ene_gang_black_3_husk", require_package = "packages/narr_jungle1"},
    [61] = {name = "npcweap_ene_gang_black_4_husk", unit = "units/payday2/characters/ene_gang_black_4/ene_gang_black_4_husk", require_package = "packages/narr_jungle1"},
    [62] = {name = "npcweap_ene_gang_mexican_1_husk", unit = "units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1_husk", require_package = "packages/narr_firestarter1"},
    [63] = {name = "npcweap_ene_gang_mexican_2_husk", unit = "units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2_husk", require_package = "packages/narr_firestarter1"},
    [64] = {name = "npcweap_ene_gang_mexican_3_husk", unit = "units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3_husk", require_package = "packages/narr_firestarter1"},
    [65] = {name = "npcweap_ene_gang_mexican_4_husk", unit = "units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4_husk", require_package = "packages/narr_firestarter1"},
    [66] = {name = "npcweap_ene_gang_mobster_1_husk", unit = "units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1_husk", require_package = "packages/narr_mia_2"},
    [67] = {name = "npcweap_ene_gang_mobster_2_husk", unit = "units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2_husk", require_package = "packages/narr_mia_2"},
    [68] = {name = "npcweap_ene_gang_mobster_3_husk", unit = "units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3_husk", require_package = "packages/narr_mia_2"},
    [69] = {name = "npcweap_ene_gang_mobster_4_husk", unit = "units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4_husk", require_package = "packages/narr_mia_2"}


}

-- Will probably need more data for these anims, hence the table structure
NPCWeap.Anims = {
    [1] = {name = "e_sp_aim_rifle_std"},
    [2] = {name = "sprint_fwd"},
    [3] = {name = "spooc_strike"},
}

function NPCWeap:GetSubtypes(data, var)
    --Lua doesn't guarantee table order
    local new_table = {}
    for i, subtable in pairs(data) do
        if subtable[var] then
            --table.insert(new_table, subtable[var])
            new_table[i] = subtable[var]
        end
    end
    return new_table
end

function NPCWeap:PrintDebug(message)
    if NPCWeap.debug_enabled then
        
        if NPCWeap.debug_systemprint and managers and managers.chat then
            managers.chat:_receive_message(ChatManager.GAME, "NPCWeapons", message, tweak_data.system_chat_color)
        else
            log(message)
        end
    end
end

function NPCWeap:PrintDebugElapsed(elapsedtime, message)
    if elapsedtime > 0.01 then
        NPCWeap:PrintDebug(message .. " took " .. string.format("%.2f", elapsedtime) .. " seconds.")
    end
end

if not NPCWeap.setup then
    local debug_clockstart = os.clock() --DEBUG
    
    local files = file.GetFiles(NPCWeap.mod_path .. "Weapons/" )
    for p, d in pairs(files) do
        local file_path = NPCWeap.mod_path .. "Weapons/" .. d
        if io.file_is_readable(file_path) then
            dofile(file_path)
        end
    end

    for p, d in pairs(NPCWeap.dofiles) do
        dofile(ModPath .. d)
    end
    NPCWeap:Load_options()
    NPCWeap.setup = true
    
    NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "NPCWeap.setup") --DEBUG
end

if RequiredScript then
    local requiredScript = RequiredScript:lower()
    if NPCWeap.hook_files[requiredScript] then
        dofile( ModPath .. NPCWeap.hook_files[requiredScript] )
    end
end

function NPCWeap:SetupPreview(id)
    
    --Destroy weapon unit
    if NPCWeap.currentUnit and managers.menu_scene._item_unit.unit:get_object(Idstring("a_weapon_right_front")) then
        World:delete_unit(NPCWeap.currentUnit)
        NPCWeap.currentUnit = nil
    end
    
    self._loaded_packages = self._loaded_packages ~= nil and self._loaded_packages or {}
    
    local prevdata = self.PrevTypes[id]
    local packages
    
    if prevdata.require_package then
        packages = type(prevdata.require_package) == "table" and prevdata.require_package or {prevdata.require_package}
        
        for _, pck in pairs(packages) do
            if table.contains(self._loaded_packages, pck) then
                table.delete(self._loaded_packages, pck)
            else
                PackageManager:load(pck)
            end
        end
    end
    
    if #self._loaded_packages > 0 then
        while(not PackageManager:loaded(self._loaded_packages[#self._loaded_packages])) do
        
        end
    end
    
    if prevdata.unit then
        log(prevdata.unit)
        managers.menu_scene:_spawn_item( prevdata.unit, nil)
        self.preview_style = 2
        managers.menu_scene._item_yaw = 180
        local unit = managers.menu_scene._item_unit.unit
        
        if unit:get_object(Idstring("a_weapon_right_front")) then
            
            local spawn_rot = unit:get_object(Idstring("a_weapon_right_front")):rotation()
            local spawn_pos = unit:get_object(Idstring("a_weapon_right_front")):position()
            
            local weap_unit = World:spawn_unit(Idstring(NPCWeap.weapons[NPCWeap.current_weapon].unit), spawn_pos, spawn_rot)
            NPCWeap:setup_weapon(weap_unit, NPCWeap.current_weapon)
            NPCWeap.currentUnit = weap_unit
            
            unit:link(Idstring("a_weapon_right_front"), weap_unit)
        end
        
        unit:anim_state_machine():play_raw(Idstring(NPCWeap.Anims[NPCWeap.CurrentAnim or 1].name))
        
        --NPCWeap.AnimBtn:set_enabled(true)
    else
        managers.menu_scene:_spawn_item( NPCWeap.weapons[NPCWeap.current_weapon].unit, nil)
        NPCWeap.currentUnit = managers.menu_scene._item_unit.unit
        self.preview_style = 1
        managers.menu_scene._item_yaw = -90
        NPCWeap:setup_weapon(managers.menu_scene._item_unit.unit, NPCWeap.current_weapon)
    end
    
    for i, pck in pairs(self._loaded_packages) do
        if PackageManager:loaded(pck) then
            log("unload")
            log(pck)
            PackageManager:unload(pck)
        end
    end
    
    self._loaded_packages = packages or {}
    
    -- Need to manipulate anims button
end

function NPCWeap:UnloadAll()
    for i, pck in pairs(self._loaded_packages) do
        if PackageManager:loaded(pck) then
            PackageManager:unload(pck)
        end
    end
    
    self._loaded_packages = {}
end

function NPCWeap:AddMultipleChoice(multi_data)
    local debug_clockstart = os.clock() --DEBUG

    local data = {
        type = "MenuItemMultiChoiceWithIcon"
    }
    for k, v in ipairs( multi_data.items or {} ) do
        table.insert( data, { _meta = "option", text_id = v, value = k } )
    end
    
    local params = {
        name = multi_data.id,
        text_id = multi_data.title,
        help_id = multi_data.desc,
        callback = multi_data.callback,
        icon = tweak_data.hud_icons:get_icon_data("icon_locked"),
        disabled_color = multi_data.disabled_color or Color(0.25, 1, 1, 1),
        row_item_color = multi_data.row_item_color or nil,
        hightlight_color = multi_data.row_item_color or nil,
        filter = true,
        localize = multi_data.localized,
    }
    
    local menu = multi_data.node
    local item = menu:create_item(data, params)
    if multi_data.enabled ~= nil then
        item:set_enabled(multi_data.enabled)
    end
    item:set_value( multi_data.value or 1 )
    menu:add_item( item )
    
    NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "NPCWeap:AddMultipleChoice") --DEBUG
end

function NPCWeap:setup_weapon(unit, name)
    local debug_clockstart = os.clock() --DEBUG
    
    local current_weap = NPCWeap.weapons[name]
    
    if current_weap then
        local enabled_objects = {}
        
        local barrel_offset = current_weap.barrel_fire_offset or Vector3(0, 0, 0)
        local barrel_len = Vector3(0,0,0) --offset in relaton to barrel
        local barrel_fg_len = Vector3(0,0,0) --offset in relaton to foregrip (only for mp5)
        local barrel_ext_len = Vector3(0,0,0) --length of the ns
        
        if not current_weap.fire_pos then
            current_weap.fire_pos = unit:get_object(Idstring("fire")):position()
        end
        
        --init objects
        for _, enabled_object in pairs(current_weap.objects_init) do
            local object = unit:get_object(Idstring(enabled_object))
            
            if object then
                    object:set_visibility(true)
            end
        end
        
        --reset all visibility
        for _, category in pairs(current_weap.categories) do
            for _, currentCategoryWeapon in pairs(current_weap[category]) do
                local object_name_sub = string.sub(currentCategoryWeapon, current_weap.object_sub, string.len(currentCategoryWeapon))
                local object = unit:get_object(Idstring(object_name_sub))
                
                if object then
                    object:set_visibility(false)
                end
            end
        end
        
        --set visibility for each category
        for _, category in pairs(current_weap.categories) do
            local current_value = NPCWeap.loaded_options[name][category]
            local current_object_value = current_weap[category][current_value]
            local object_name
            
            if current_object_value ~= "random" then
                object_name = string.sub(current_object_value, current_weap.object_sub, string.len(current_object_value))
            else
                local random_object = NPCWeap:get_random(current_weap, category, name, unit)
                
                --hope to RNJesus that you roll one of these motherfuckers
                if current_weap.spooci and current_weap.spooci[category] then
                    local rngNumber = math.random(1, 10000) / 100.0
                    for spoociItemKey, spoociItem in pairs(current_weap.spooci[category]) do
                        if rngNumber <= spoociItemKey then
                            random_object = spoociItem[math.random(#spoociItem)]
                            break
                        end
                        
                    end
            
                end
                
                object_name = string.sub(random_object, current_weap.object_sub, string.len(random_object))
            end
            
                local selected_object = unit:get_object(Idstring(object_name))
                
                if selected_object then
                    selected_object:set_visibility(true)
                    table.insert(enabled_objects, object_name)
                end
            
            --reset the requested items for the section
            for _, required_reset_item in pairs(current_weap.required_reset[category]) do
                if required_reset_item ~= object_name then
                    local object = unit:get_object(Idstring(required_reset_item))
                    if object then
                        object:set_visibility(false)
                    end
                end
            end
            
            --enable the required objects (if any)
            if current_weap.required[object_name] then
                local required_table = current_weap.required[object_name]
                for _, requiredItems in pairs(required_table) do
                    local object = unit:get_object(Idstring(requiredItems))
                    
                    if object then
                        object:set_visibility(true)
                    end
                end
            end
            
            --Get offsets
            if category == "barrel" then
                if current_weap[object_name] and current_weap[object_name].barrel_ext then
                    barrel_len = current_weap[object_name].barrel_ext
                end
            elseif category == "foregrip" then
                if current_weap[object_name] and current_weap[object_name].barrel_ext then
                    barrel_fg_len = current_weap[object_name].barrel_ext
                end
            elseif category == "barrel_ext" then
                if current_weap[object_name] and current_weap[object_name].length then
                    barrel_ext_len = current_weap[object_name].length
                end
            end
            
        end
        
        --adjust position
        for _, object_name in pairs(enabled_objects) do
            if current_weap[object_name] then
                for current_objectKey, current_object in pairs(current_weap[object_name]) do
                    if current_weap[current_objectKey] then
                        for _, category_object_name in pairs(current_weap[current_objectKey]) do
                            local object_string = string.sub(category_object_name, current_weap.object_sub, string.len(category_object_name))
                            local object = unit:get_object(Idstring(object_string))
                            if object and object:visibility() == true then
                                object:set_local_position(current_object)
                                if current_weap.required[object_string] then
                                    local required_table = current_weap.required[object_string]
                                    for _, requiredItem in pairs(required_table) do
                                        local object_req = unit:get_object(Idstring(requiredItem))
                                        if object_req then
                                            object_req:set_local_position(current_object)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    --adjust spooci
                    if current_weap.spooci and current_weap.spooci[current_objectKey] then
                        for _, spooci_object_list in pairs(current_weap.spooci[current_objectKey]) do
                            for _, spooci_object_name in pairs(spooci_object_list) do
                                local object_string = string.sub(spooci_object_name, current_weap.object_sub, string.len(spooci_object_name))
                                local object = unit:get_object(Idstring(object_string))
                                if object and object:visibility() == true then
                                    object:set_local_position(current_object)
                                    if current_weap.required[object_string] then
                                        local required_table = current_weap.required[object_string]
                                        for _, requiredItem in pairs(required_table) do
                                            local object_req = unit:get_object(Idstring(requiredItem))
                                            if object_req then
                                                object_req:set_local_position(current_object)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        
        --Adjust Fire position
        if unit:get_object(Idstring("fire")) then
            unit:get_object(Idstring("fire")):set_local_position(current_weap.fire_pos + barrel_len + barrel_offset + barrel_fg_len + barrel_ext_len)
        end
        for requiredItemKey, requiredItems in pairs(current_weap.required) do
            for _, reqItem in pairs(requiredItems) do
                local req_object = unit:get_object(Idstring(requiredItemKey))
                if req_object and req_object:visibility() == true then
                    local object = unit:get_object(Idstring(reqItem))
                    if object then
                        object:set_visibility(true)
                    end
                end
            end
        end
        
    end
    
    NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "NPCWeap:setup_weapon") --DEBUG
end

Hooks:Add("LocalizationManagerPostInit", "NPCWeap_Localization", function(loc)
    LocalizationManager:add_localized_strings({
        ["NPCWeap_button"] = "NPC Weapon Customization",
        ["NPCWeap_button_help"] = "Customize NPC weapons",
        ["NPCWeapOptions_button"] = "NPC Weapon Options",
        ["NPCWeapOptions_button_help"] = "Customize the options for NPC weapons",
        
        ["npcweap_global_sync"] = "Use Host customization (When possible)",
        ["npcweap_global_sync_help"] = "",
        
        ["barrel_title"] = "Barrel",
        ["body_title"] = "Body",
        ["barrel_ext_title"] = "Barrel Extension",
        ["magazine_title"] = "Magazine",
        ["upper_reciever_title"] = "Upper Reciever",
        ["stock_title"] = "Stock",
        ["sight_title"] = "Scopes",
        ["slide_title"] = "Slide",
        ["foregrip_title"] = "Foregrip",
        ["grip_title"] = "Grip",
        ["attachment_title"] = "Attachment",
        ["vertical_grip_title"] = "Vertical Grip",
        ["lower_receiver_title"] = "Lower Receiver",
        ["drag_handle_title"] = "Drag Handle",
        ["rail_title"] = "Rail",
        
        ["npcweap_prev_title"] = "Preview Type",
        --Different preview types
        ["npcweap_weapon"] = "Weapon",
        ["npcweap_ene_cop_1_husk"] = "Cop 1",
        ["npcweap_ene_cop_2_husk"] = "Cop 2",
        ["npcweap_ene_cop_3_husk"] = "Cop 3",
        ["npcweap_ene_cop_4_husk"] = "Cop 4",
        ["npcweap_ene_security_1_husk"] = "Security 1",
        ["npcweap_ene_security_2_husk"] = "Security 2",
        ["npcweap_ene_security_3_husk"] = "Security 3",
        ["npcweap_ene_security_4_husk"] = "Security 4",
        ["npcweap_ene_security_5_husk"] = "Security 5",
        ["npcweap_ene_security_6_husk"] = "Security 6",
        ["npcweap_ene_security_7_husk"] = "Security ",
        ["npcweap_ene_city_swat_1_husk"] = "City SWAT 1",
        ["npcweap_ene_city_swat_2_husk"] = "City SWAT 2",
        ["npcweap_ene_city_swat_3_husk"] = "City SWAT 3",
        ["npcweap_ene_fbi_1_husk"] = "FBI 1",
        ["npcweap_ene_fbi_2_husk"] = "FBI 2",
        ["npcweap_ene_fbi_3_husk"] = "FBI 3",
        ["npcweap_ene_fbi_boss_1_husk"] = "FBI Boss",
        ["npcweap_ene_fbi_female_1_husk"] = "Female FBI 1",
        ["npcweap_ene_fbi_female_2_husk"] = "Female FBI 2",
        ["npcweap_ene_fbi_female_3_husk"] = "Female FBI 3",
        ["npcweap_ene_fbi_female_4_husk"] = "Female FBI 4",
        ["npcweap_ene_fbi_heavy_1_husk"] = "Heavy FBI",
        ["npcweap_ene_fbi_office_1_husk"] = "Office FBI 1",
        ["npcweap_ene_fbi_office_2_husk"] = "Office FBI 2",
        ["npcweap_ene_fbi_office_3_husk"] = "Office FBI 3",
        ["npcweap_ene_fbi_office_4_husk"] = "Office FBI 4",
        ["npcweap_ene_fbi_swat_1_husk"] = "FBI SWAT 1",
        ["npcweap_ene_fbi_swat_2_husk"] = "FBI SWAT 2",
        ["npcweap_ene_murkywater_1_husk"] = "Murkywater 1",
        ["npcweap_ene_murkywater_2_husk"] = "Murkywater 2",
        ["npcweap_ene_prisonguard_female_1_husk"] = "Female Prison Guard",
        ["npcweap_ene_prisonguard_male_1_husk"] = "Male Prison Guard",
        ["npcweap_ene_secret_service_1_husk"] = "Secret Service 1",
        ["npcweap_ene_secret_service_2_husk"] = "Secret Service 2",
        ["npcweap_ene_shield_1_husk"] = "Shield 1",
        ["npcweap_ene_shield_2_husk"] = "Shield 2",
        ["npcweap_ene_sniper_1_husk"] = "Sniper 1",
        ["npcweap_ene_sniper_2_husk"] = "Sniper 2",
        ["npcweap_ene_spook_1_husk"] = "Cloaker",
        ["npcweap_ene_swat_1_husk"] = "SWAT 1",
        ["npcweap_ene_swat_2_husk"] = "SWAT 2",
        ["npcweap_ene_swat_heavy_1_husk"] = "Heavy SWAT",
        ["npcweap_ene_tazer_1_husk"] = "Taser",
        ["npcweap_ene_bulldozer_1_husk"] = "Bulldozer 1",
        ["npcweap_ene_bulldozer_2_husk"] = "Bulldozer 2",
        ["npcweap_ene_bulldozer_3_husk"] = "Bulldozer 3",
        ["npcweap_ene_bulldozer_4_husk"] = "Bulldozer 4",
        ["npcweap_ene_gang_mobster_boss_husk"] = "Komissar",
        ["npcweap_ene_gang_russian_2_husk"] = "Russian 1",
        ["npcweap_ene_gang_russian_4_husk"] = "Russian 2",
        ["npcweap_ene_gang_russian_5_husk"] = "Russian 3",
        ["npcweap_ene_biker_1_husk"] = "Biker 1",
        ["npcweap_ene_biker_2_husk"] = "Biker 2",
        ["npcweap_ene_biker_3_husk"] = "Biker 3",
        ["npcweap_ene_biker_4_husk"] = "Biker 4",
        ["npcweap_ene_gang_black_1_husk"] = "Gang 1",
        ["npcweap_ene_gang_black_2_husk"] = "Gang 2",
        ["npcweap_ene_gang_black_3_husk"] = "Gang 3",
        ["npcweap_ene_gang_black_4_husk"] = "Gang 4",
        ["npcweap_ene_gang_mexican_1_husk"] = "Mexican Gang 1",
        ["npcweap_ene_gang_mexican_2_husk"] = "Mexican Gang 2",
        ["npcweap_ene_gang_mexican_3_husk"] = "Mexican Gang 3",
        ["npcweap_ene_gang_mexican_4_husk"] = "Mexican Gang 4",
        ["npcweap_ene_gang_mobster_1_husk"] = "Mobster 1",
        ["npcweap_ene_gang_mobster_2_husk"] = "Mobster 2",
        ["npcweap_ene_gang_mobster_3_husk"] = "Mobster 3",
        ["npcweap_ene_gang_mobster_4_husk"] = "Mobster 4",
    })
end)

Hooks:Add("MenuManagerSetupCustomMenus", "Base_SetupNPCWeapMenu", function( menu_manager, nodes )
    MenuHelper:NewMenu( NPCWeap.menu_name )
    MenuHelper:NewMenu( NPCWeap.OptionMenuName )
end)
math.randomseed(os.time())
function NPCWeap:get_random(current_weap, category, weap_name, unit)
    local debug_clockstart = os.clock() --DEBUG

    local value = math.random(#current_weap[category] - 1)
    local random_object = current_weap[category][value]
    
    if current_weap.incompatible[random_object] then
        local incompat_list = current_weap.incompatible[random_object]
        
        for _, curr_category in pairs(current_weap.categories) do
            for _, incompatibleItem in pairs(incompat_list) do
                local value = NPCWeap.loaded_options[weap_name][curr_category]
                
                if current_weap[curr_category][value] == incompatibleItem then
                    return self:get_random(current_weap, category, weap_name, unit)
                end
                
                local object = string.sub(incompatibleItem, current_weap.object_sub, string.len(incompatibleItem))
                
                if unit:get_object(Idstring(object)) and unit:get_object(Idstring(object)):visibility() == true then
                    return self:get_random(current_weap, category, weap_name, unit)
                end
                
            end
        end
    end
    
    NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "NPCWeap:get_random") --DEBUG
    return random_object
end

function NPCWeap:AddToggle( toggle_data, node)
    local debug_clockstart = os.clock() --DEBUG

    local data = {
        type = "CoreMenuItemToggle.ItemToggle",
        {
            _meta = "option",
            icon = "guis/textures/menu_tickbox",
            value = "on",
            x = 24,
            y = 0,
            w = 24,
            h = 24,
            s_icon = "guis/textures/menu_tickbox",
            s_x = 24,
            s_y = 24,
            s_w = 24,
            s_h = 24
        },
        {
            _meta = "option",
            icon = "guis/textures/menu_tickbox",
            value = "off",
            x = 0,
            y = 0,
            w = 24,
            h = 24,
            s_icon = "guis/textures/menu_tickbox",
            s_x = 0,
            s_y = 24,
            s_w = 24,
            s_h = 24
        }
    }

    local params = {
        name = toggle_data.id,
        text_id = toggle_data.title,
        help_id = toggle_data.desc,
        callback = toggle_data.callback,
        disabled_color = toggle_data.disabled_color or Color( 0.25, 1, 1, 1 ),
        localize = toggle_data.localized,
    }

    local item = node:create_item( data, params )
    item:set_value( toggle_data.value and "on" or "off" )

    if toggle_data.disabled then
        item:set_enabled( not toggle_data.disabled )
    end
    
    NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "NPCWeap:AddToggle") --DEBUG
    return node:add_item(item)
end

function NPCWeap:update_compatibility_item(node_items, this)
    local debug_clockstart = os.clock() --DEBUG

    for nodeKey, nodeItem in pairs( node_items ) do
        if nodeItem.item.set_enabled then

            if nodeItem.item._parameters.name and NPCWeap.incompat_categories_button[nodeItem.item._parameters.name] and #NPCWeap.incompat_categories_button[nodeItem.item._parameters.name] > 0 then
                node_items[nodeKey].item._parameters.row_item_color = Color.red:with_alpha(0.5)
            else
                node_items[nodeKey].item._parameters.row_item_color = nil
            end
            nodeItem.item:set_enabled(true)
            this:refresh_node()
        end
    end
    
    NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "NPCWeap:update_compatibility_item") --DEBUG
end

function NPCWeap:update_compatibility(item, this, current_weap, current_value)
    local debug_clockstart = os.clock() --DEBUG

    local node_items = item._parameters.gui_node.row_items
    NPCWeap:update_compatibility_item(node_items, this)
    
    NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "NPCWeap:update_compatibility") --DEBUG
end

function NPCWeap:update(t, dt)
    if NPCWeap._loading_circle then
        if not PackageManager:all_packages_loaded() then
            NPCWeap._loading_circle:set_visible(true)
            NPCWeap._loading_circle:rotate(180 * dt)
        else
            NPCWeap._loading_circle:set_visible(false)
            NPCWeap._panel:remove(NPCWeap._loading_circle)
            NPCWeap._loading_circle = nil
            NPCWeap:SetupPreview(NPCWeap.CurrentPreview)
        end
    end
end

Hooks:Add("MenuManagerPopulateCustomMenus", "Base_PopulateNPCWeapMenu", function( menu_manager, nodes )
    MenuCallbackHandler.refresh_weapon = function(this, item)
        local debug_clockstart = os.clock() --DEBUG
        
        local unit = managers.menu_scene._item_unit.unit
        
        if NPCWeap.currentUnit then
            unit = NPCWeap.currentUnit
        end
        
        local current_weap = NPCWeap.weapons[NPCWeap.current_weapon]
        local current_value = current_weap[item:name()][item:value()]
        NPCWeap.incompat_categories = NPCWeap.incompat_categories or {}
        local incompatible 
        if current_weap.incompatible[current_value] then
            local incompat_list = current_weap.incompatible[current_value]
            
            for _, category in pairs(current_weap.categories) do
                for _, incompat_list_item in pairs(incompat_list) do
                    if table.contains(current_weap[category], incompat_list_item) then
                    
                        local value = NPCWeap.loaded_options[NPCWeap.current_weapon][category]
                        
                        if current_weap[category][value] == incompat_list_item then
                            NPCWeap.incompat_categories[item:name()] = NPCWeap.incompat_categories[item:name()] or {}
                            if not table.contains(NPCWeap.incompat_categories[item:name()], category) then
                                table.insert(NPCWeap.incompat_categories[item:name()], category)
                            end

                            --for self
                            if NPCWeap.incompat_categories_button[item:name()] then
                            
                                if not table.contains(NPCWeap.incompat_categories_button[item:name()], category) then
                                    table.insert(NPCWeap.incompat_categories_button[item:name()], category)
                                end
                            
                            else
                                NPCWeap.incompat_categories_button[item:name()] = {}
                                table.insert(NPCWeap.incompat_categories_button[item:name()], category)
                            end
                            --for other
                            if NPCWeap.incompat_categories_button[category] then
                            
                                if not table.contains(NPCWeap.incompat_categories_button[category], item:name()) then
                                    table.insert(NPCWeap.incompat_categories_button[category], item:name())
                                end
                            
                            else
                                NPCWeap.incompat_categories_button[category] = {}
                                table.insert(NPCWeap.incompat_categories_button[category], item:name())
                            end
                            
                            incompatible = true
                        end
                        
                        local string = string.sub(incompat_list_item, current_weap.object_sub, string.len(incompat_list_item))
                        local object_incompat = unit:get_object(Idstring(string))
                        
                        if object_incompat then
                            if object_incompat:visibility() == true then
                                NPCWeap.incompat_categories[item:name()] = NPCWeap.incompat_categories[item:name()] or {}
                                if not table.contains(NPCWeap.incompat_categories[item:name()], category) then
                                    table.insert(NPCWeap.incompat_categories[item:name()], category)
                                end
                                
                                --for self
                                if NPCWeap.incompat_categories_button[item:name()] then
                                
                                    if not table.contains(NPCWeap.incompat_categories_button[item:name()], category) then
                                        table.insert(NPCWeap.incompat_categories_button[item:name()], category)
                                    end
                                
                                else
                                    NPCWeap.incompat_categories_button[item:name()] = {}
                                    table.insert(NPCWeap.incompat_categories_button[item:name()], category)
                                end
                                --for other
                                if NPCWeap.incompat_categories_button[category] then
                                
                                    if not table.contains(NPCWeap.incompat_categories_button[category], item:name()) then
                                        table.insert(NPCWeap.incompat_categories_button[category], item:name())
                                    end
                                
                                else
                                    NPCWeap.incompat_categories_button[category] = {}
                                    table.insert(NPCWeap.incompat_categories_button[category], item:name())
                                end
                                
                                incompatible = true
                            end
                        end
                        
                    end
                end
            end
        end
        if incompatible then
            local node_items = item._parameters.gui_node.row_items
            NPCWeap:update_compatibility_item(node_items, this)
            return
        end
        
        if NPCWeap.incompat_categories_button[item:name()] then
            
            for incompat_category_Key, incompat_category_Item in pairs(NPCWeap.incompat_categories_button[item:name()]) do
            
                if NPCWeap.incompat_categories_button[incompat_category_Item] then
                    
                    for incompat_sub_category_Key, incompat_sub_category_Item in pairs(NPCWeap.incompat_categories_button[incompat_category_Item]) do
                        if incompat_sub_category_Item == item:name() then
                            table.remove(NPCWeap.incompat_categories_button[incompat_category_Item], incompat_sub_category_Key)
                            break
                        end
                    end
                end
            end
            
            NPCWeap.incompat_categories_button[item:name()] = {}
        end
        NPCWeap:update_compatibility(item, this, current_weap, current_value)
        NPCWeap.loaded_options[NPCWeap.current_weapon][item:name()] = item:value()
        NPCWeap:Save()
        for p, d in pairs(current_weap[item:name()]) do
            local string = string.sub(d, current_weap.object_sub, string.len(d))
            local object = unit:get_object(Idstring(string))
            if object then
                object:set_visibility(false)
            end
        end
        NPCWeap:update_category(unit, current_weap, current_value, item:name())
        
        NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "MenuCallbackHandler.refresh_weapon") --DEBUG
    end
    
    MenuCallbackHandler.reset_buttons = function(this, item)
        NPCWeap:UnloadAll()
        --Destroy weapon unit
        if NPCWeap.currentUnit and managers.menu_scene._item_unit.unit:get_object(Idstring("a_weapon_right_front")) then
            World:delete_unit(NPCWeap.currentUnit)
            NPCWeap.currentUnit = nil
        end
        managers.menu_scene:remove_item()
        nodes.blackmarket_preview_node:clean_items()
        managers.menu:add_back_button(nodes.blackmarket_preview_node)
        if alive(NPCWeap._title_text) then
            NPCWeap._title_text:set_visible(false)
        end
    end
    
    MenuCallbackHandler.npc_weap_toggle_customization = function(this, item)
        NPCWeap.loaded_options[NPCWeap.current_weapon].enabled = item:value() == "on" and true or false
        local node_items = item._parameters.gui_node.row_items
        for nodeKey, nodeItem in pairs( node_items ) do
            if nodeItem.item.set_enabled then
                if nodeItem.item._parameters.name ~= nil then
                    if nodeItem.item._parameters.name ~= NPCWeap.current_weapon and nodeItem.item._parameters.name ~= item:name() then
                        nodeItem.item:set_enabled(NPCWeap.loaded_options[NPCWeap.current_weapon].enabled)
                        this:refresh_node()
                    end
                end
            end
        end
        NPCWeap:Save()
    end
    MenuCallbackHandler.refresh_weapon_action = function(this, item)
        if NPCWeap.currentUnit then
            NPCWeap:setup_weapon(NPCWeap.currentUnit, item:name())
        else
            NPCWeap:setup_weapon(managers.menu_scene._item_unit.unit, item:name())
        end
    end
    
    MenuCallbackHandler.NPCWeapPrevTypeChanged = function(this, item)
        NPCWeap.CurrentPreview = item:value()
        if PackageManager:all_packages_loaded() then
            NPCWeap:SetupPreview(item:value())
        else
            NPCWeap._panel = NPCWeap._panel or managers.gui_data:create_saferect_workspace():panel()
            NPCWeap._loading_circle = NPCWeap._panel:bitmap({
                name = "_loading_circle",
                texture = "guis/textures/icon_loading",
                layer = 0,
                visible = false
            })
            NPCWeap._loading_circle:set_center(NPCWeap._panel:center())
        end
    end
    
    MenuCallbackHandler.NPCWeapAnimChanged = function(this, item)
        if NPCWeap.preview_style == 2 then
            managers.menu_scene._item_unit.unit:anim_state_machine():play_raw(Idstring(NPCWeap.Anims[item:value()].name))
        end
        NPCWeap.CurrentAnim = item:value()
    end
    
    MenuCallbackHandler.setup_buttons = function(this, item)
        NPCWeap.current_weapon = item:name()
        for p, d in pairs(NPCWeap.weapons[item:name()].categories) do
            NPCWeap:AddMultipleChoice({
                id = d,
                title = d .. "_title",
                callback = "refresh_weapon",
                node = nodes.blackmarket_preview_node,
                value = NPCWeap.loaded_options[item:name()][d],
                items = NPCWeap.weapons[item:name()][d],
                enabled = NPCWeap.loaded_options[item:name()].enabled,
            })
        end
        
        local divider_params = {
            name = "divider_" .. item:name(),
            no_text = true,
            size = 8,
        }
        local new_menu_divider = nodes.blackmarket_preview_node:create_item({type = "MenuItemDivider"}, divider_params)
        nodes.blackmarket_preview_node:add_item(new_menu_divider)
        local params = {
            name = item:name(),
            text_id = "Refresh weapon",
            localize = false,
            callback = "refresh_weapon_action",
            localize_help = false,
            row_item_color = tweak_data.screen_colors.button_stage_3,
        }
        
        NPCWeap:AddMultipleChoice({
            id = "NPCWeapPrev",
            title = "npcweap_prev_title",
            help = "npcweap_prev_help",
            callback = "NPCWeapPrevTypeChanged",
            node = nodes.blackmarket_preview_node,
            value = 1,
            items = NPCWeap:GetSubtypes(NPCWeap.PrevTypes, "name"),
            enabled = true,
        })
        
        NPCWeap:AddMultipleChoice({
            id = "NPCWeapAnim",
            title = "npcweap_anim_title",
            help = "npcweap_anim_help",
            callback = "NPCWeapAnimChanged",
            node = nodes.blackmarket_preview_node,
            value = 1,
            items = NPCWeap:GetSubtypes(NPCWeap.Anims, "name"),
            enabled = true, -- This should be false, so it isn't enabled with the weapon preview style, but I wasn't able to quickly make it reanable easily
        })
        --NPCWeap.AnimBtn = nodes.blackmarket_preview_node:item("NPCWeapAnim")
        local new_item = nodes.blackmarket_preview_node:create_item({type = "CoreMenuItem.Item"}, params)
        nodes.blackmarket_preview_node:add_item(new_item)
        local make_fine_text = function(text)
            local x, y, w, h = text:text_rect()
            text:set_size(w, h)
            text:set_position(math.round(text:x()), math.round(text:y()))
        end
        if not NPCWeap._panel and not NPCWeap._title_text then
            NPCWeap._panel = managers.gui_data:create_saferect_workspace():panel()
            NPCWeap._title_text = NPCWeap._panel:text({
                name = "title_text",
                text = "weapon",
                visible = false,
                font_size = tweak_data.menu.pd2_large_font_size,
                font = tweak_data.menu.pd2_large_font,
                color = tweak_data.screen_colors.button_stage_3
            })
        end
        if alive(NPCWeap._title_text) then
            NPCWeap._title_text:set_visible(true)
            NPCWeap._title_text:set_text(string.upper(NPCWeap.weapons[item:name()].display_name))
        end
        managers.menu:open_node("blackmarket_preview_node", {{ back_callback = callback(MenuCallbackHandler, MenuCallbackHandler, "reset_buttons") }})
        managers.dyn_resource:load(Idstring("unit"), Idstring(NPCWeap.weapons[item:name()].unit), DynamicResourceManager.DYN_RESOURCES_PACKAGE, false)
        managers.menu_scene:_spawn_item( NPCWeap.weapons[item:name()].unit, nil)
        NPCWeap.currentUnit = managers.menu_scene._item_unit.unit
        managers.menu_scene._item_yaw = -90
        NPCWeap:setup_weapon(managers.menu_scene._item_unit.unit, item:name())
    end
    for p, d in pairs(NPCWeap.weapons) do
        MenuHelper:AddButton({
            id = d.name_id,
            title = d.display_name,
            localized = "false",
            callback = "setup_buttons",
            menu_id = NPCWeap.menu_name
        })
    end
    
    MenuCallbackHandler.NPCWeapGlobalSyncClbk = function(this, item)
        NPCWeap.loaded_options.GlobalSync = item:value() == "on" and true or false
        NPCWeap:Save()
    end
        
    MenuHelper:AddToggle({
        id = "NPCWeapGlobalSync",
        title = "npcweap_global_sync",
        desc = "npcweap_global_sync_help",
        callback = "NPCWeapGlobalSyncClbk",
        --disabled_color = ,
        icon_by_text = false,
        menu_id = NPCWeap.OptionMenuName,
        value = NPCWeap.loaded_options.GlobalSync
        --priority = 1001
    })
end)

Hooks:Add("MenuUpdate", "NPCWeapMenuUpdate", function( t, dt )
	NPCWeap:update(t, dt)
end)

Hooks:Add("GameSetupUpdate", "NPCWeapGameSetupUpdate", function( t, dt )
	NPCWeap:update(t, dt)
end)

function NPCWeap:update_category(unit, current_weap, current_value, category)
    local debug_clockstart = os.clock() --DEBUG

    local object_name
    if current_value ~= "random" then
        object_name = string.sub(current_value, current_weap.object_sub, string.len(current_value))
    else
        local random_object = NPCWeap:get_random(current_weap, category, NPCWeap.current_weapon, unit)
        object_name = string.sub(random_object, current_weap.object_sub, string.len(random_object))
    end
    if object_name ~= "none" then
        local object = unit:get_object(Idstring(object_name))
        if object then
            object:set_visibility(true)
        end
    end
    if current_weap[object_name] then
        for p, k in pairs(current_weap[object_name]) do
            if current_weap[p] then
                for x, y in pairs(current_weap[p]) do
                    local object_string = string.sub(y, current_weap.object_sub, string.len(y))
                    local object = unit:get_object(Idstring(object_string))
                    if object and object:visibility() == true then
                        object:set_local_position(k)
                        if current_weap.required[object_string] then
                            local required_table = current_weap.required[object_string]
                            for p, d in pairs(required_table) do
                                local object_req = unit:get_object(Idstring(d))
                                if object_req then
                                    object_req:set_local_position(k)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if current_weap.pos_check and current_weap.pos_check[category] then
        for _, pos_category in pairs(current_weap.pos_check[category]) do
            for _, object_wpre in pairs(current_weap[pos_category]) do
                local object_string = string.sub(object_wpre, current_weap.object_sub, string.len(object_wpre))
                local wpre_object = unit:get_object(Idstring(object_string))
                if wpre_object and wpre_object:visibility() == true then
                    if current_weap[object_string] then
                        for vcategory, vector in pairs(current_weap[object_string]) do
                            if vcategory == category then
                                local object = unit:get_object(Idstring(object_name))
                                if object and object:visibility() == true then
                                    object:set_local_position(vector)
                                    if current_weap.required[object_name] then
                                        local required_table = current_weap.required[object_name]
                                        for p, d in pairs(required_table) do
                                            local object_req = unit:get_object(Idstring(d))
                                            if object_req then
                                                object_req:set_local_position(vector)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    for p, d in pairs(current_weap.required_reset[category]) do
        local object = unit:get_object(Idstring(d))
        if object then
            object:set_visibility(false)
        end
    end
    
    if current_weap.absolute_reset_on_update then
        for aroupdKey, aroupdVal in pairs(current_weap.absolute_reset_on_update) do
            for _, aroupdItem in pairs(aroupdVal) do
                local object = unit:get_object(Idstring(aroupdItem))
                if object and object:visibility() == true then
                    object:set_visibility(false)
                    NPCWeap:update_category(unit, current_weap, "random", aroupdKey)
                end
            end
        end
    end
    
    if current_weap.required[object_name] then
        local required_table = current_weap.required[object_name]
        for p, d in pairs(required_table) do
            local object = unit:get_object(Idstring(d))
            if object then
                object:set_visibility(true)
            end
        end
    end
    for p, d in pairs(current_weap.required) do
        for i, j in pairs(d) do
            local req_object = unit:get_object(Idstring(p))
            if req_object and req_object:visibility() == true then
                local object = unit:get_object(Idstring(j))
                if object then
                    object:set_visibility(true)
                end
            end
        end
    end
    
    NPCWeap:PrintDebugElapsed(os.clock() - debug_clockstart, "NPCWeap:update_category") --DEBUG
end
    
Hooks:Add("MenuManagerBuildCustomMenus", "Base_BuildNPCWeapMenu", function( menu_manager, nodes )
    if nodes.main then
        nodes[NPCWeap.menu_name] = MenuHelper:BuildMenu( NPCWeap.menu_name )
        MenuHelper:AddMenuItem( MenuHelper.menus.lua_mod_options_menu, NPCWeap.menu_name, "NPCWeap_button", "NPCWeap_button_help", 1 )
        nodes[NPCWeap.menu_name]._parameters.scene_state = "standard"
    end
    nodes[NPCWeap.OptionMenuName] = MenuHelper:BuildMenu( NPCWeap.OptionMenuName )
    MenuHelper:AddMenuItem( MenuHelper.menus.lua_mod_options_menu, NPCWeap.OptionMenuName, "NPCWeapOptions_button", "NPCWeapOptions_button_help", 1 )
    nodes[NPCWeap.OptionMenuName]._parameters.scene_state = "standard"
end)
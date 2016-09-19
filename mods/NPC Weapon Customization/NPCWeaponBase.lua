--CloneClass(NPCRaycastWeaponBase)

local init_original = NPCRaycastWeaponBase.init
function NPCRaycastWeaponBase:init(unit)
  init_original(self, unit)
  NPCWeap:setup_weapon(self._unit, self._name_id)
end

function NPCRaycastWeaponBase:set_laser_enabled(state, npc_weapon_customize)
    if state then
        if alive(self._laser_unit) then
            return
        end
        local spawn_rot = self._obj_fire:rotation()
        local spawn_pos = self._obj_fire:position()
        if not npc_weapon_customize then
            spawn_pos = spawn_pos - spawn_rot:y() * 8 + spawn_rot:z() * 2 - spawn_rot:x() * 1.5
        else
            spawn_pos = spawn_pos - spawn_rot:y() * 8 + spawn_rot:z() * 2 - spawn_rot:x() * 1.5
        end
        self._laser_unit = World:spawn_unit(Idstring("units/payday2/weapons/wpn_npc_upg_fl_ass_smg_sho_peqbox/wpn_npc_upg_fl_ass_smg_sho_peqbox"), spawn_pos, spawn_rot)
        self._unit:link(self._obj_fire:name(), self._laser_unit)
        self._laser_unit:base():set_npc()
        self._laser_unit:base():set_on()
        self._laser_unit:base():set_color_by_theme("cop_sniper")
        self._laser_unit:base():set_max_distace(10000)
        if npc_weapon_customize then
            self._laser_unit:get_object(Idstring("g_peqbox")):set_visibility(false)
            self._laser_unit:get_object(Idstring("g_laser")):set_visibility(false)
            self._laser_unit:get_object(Idstring("g_indicator")):set_visibility(false)
            --log("set_objects_invis")
        end
    elseif alive(self._laser_unit) then
        self._laser_unit:set_slot(0)
        self._laser_unit = nil
    end
end

function NPCRaycastWeaponBase:set_flashlight_enabled(enabled)
    if not self._flashlight_data then
        return
    end
    --log("set_flashlight_enabled")
    self._flashlight_data.enabled = enabled
    if managers.game_play_central:flashlights_on() and enabled then
        self._flashlight_data.light:set_enable(self._flashlight_light_lod_enabled)
        self._flashlight_data.effect:activate()
        self._flashlight_data.on = true
    else
        self._flashlight_data.light:set_enable(false)
        self._flashlight_data.effect:kill_effect()
        self._flashlight_data.on = false
    end
end
if not CLIENT then return end

local DELAY = 2
local TIMER_ID = "chat_flash_delay"

local function ScheduleFlash()
    if timer.Exists(TIMER_ID) then
        timer.Remove(TIMER_ID)
    end

    timer.Create(TIMER_ID, DELAY, 1, function()
        if system.IsWindows() and not system.HasFocus() then
            system.FlashWindow()
        end
    end)
end

hook.Add("OnPlayerChat", "chat_flash_on_player", ScheduleFlash)
hook.Add("ChatText",     "chat_flash_on_text",   ScheduleFlash)

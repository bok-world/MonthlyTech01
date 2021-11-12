-- declarations
local Figure = script.Parent
local head = Figure:WaitForChild("Head")
local Humanoid;
for _,Child in pairs(Figure:GetChildren()) do
  if Child and Child.Classname == "Humanoid" then 
    Humanoid=Child;
  end;
end;

-- regeneration
local regening = false
function regenHealth()
  if regening then return end
  regening = true
  while Humanoid.Health < Humanoid.MaxHealth do
    local s = wait(1)
    local health = Humanoid.Health 
    if health~=0 and health < Humanoid.MaxHealth then
      local newHealthDelta = 0.007 * s * Humanoid.MaxHealth
      health = health + newHealthDelta
      Humanoid.Health = math.min(health,Humanoid.MaxHealth)
    end

    if Humanoid.Health > Humanoid.MaxHealth then
      Humanoid.Health = Humanoid.MaxHealth
    end

    regening = false
end


Humanoid.HealthChanged:connect(regenhealth)

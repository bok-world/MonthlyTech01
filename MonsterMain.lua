loacl JeffTheKillerScript = Script;

repeat Wait(0)
until JeffTheKillerScript and JeffTheKillerScript.Parent and JeffTheKillerScript.Parent.Classname=="Model" and JeffTheKillerScript.Parent:FindFirstChild("Head") and JeffTheKillerScript.Parent:FindFirstChild("Torso")

local JeffTheKillerScript=JeffTheKillerScript.Parent;
function raycast(spos,vec,currentdist) -- 광선거리 (findPartonray는 이제 사용되지 않지만, 한방향으로 갈수있는 함수인듯하다 .)
  local hit2,pos2= game.Workspace:FindPartOnRay(Ray.new(Spos +(vec * 05), vec*currentdist), JeffTheKillerScript);

  if hit2 ~= nil and pos2 then
    if hit2.name=="handle" and not hit2.CanCollide or string.sub(hit2.Name,1,6)  == "Effect" and not hit2.CanCollide then
      local currentdist = currentdist-(pos2 -Spos).magnitude;
      return raycast(pos2,vec,currentdist)
    end;
  end;
  return hit2,pos2;
end;


local JeffTheKillerHumanoid;
for _,child in pairs (JeffTheKiller:GetChildren()) do
  if child and child.Classname == "Humanoid" and child.Health ~=0 then
    JeffTheKillerHumanoid = child;
  end;
end;

local AttackDebounce = false;
local JeffTheKillerKnife = JeffTheKiller:FindFirstChild('Knife');
local JeffTheKillerhead = JeffTheKiller:FindFirstChild('Head');
local JeffTheKillerHumanoidRootPart = JeffTheKiller:FindFirstChild("HumanoidRootPart");
local WalkDebounce=false;
local Notice=false;
local JeffLaughDebounce=false;
local MusicDebounce=false;
local NoticeDebounce = false;
local ChosenMusic;
JeffTehKiller:FindFirstChild("Torso"):FindFirstChild("Neck").CO=CFrame.new(0,1,0,)


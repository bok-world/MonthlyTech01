local JeffTheKillerScript = Script;

repeat Wait(0)
until JeffTheKillerScript and JeffTheKillerScript.Parent and JeffTheKillerScript.Parent.Classname=="Model" and JeffTheKillerScript.Parent:FindFirstChild("Head") and JeffTheKillerScript.Parent:FindFirstChild("Torso")

local JeffTheKiller=JeffTheKillerScript.Parent;
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
JeffTheKiller:FindFirstChild("Torso"):FindFirstChild("Neck").CO=CFrame.new(0,1,0,-1,0,0,0,0,1,0,1,-0);
local OriginalCO=JeffTheKiller:FindFirstChild("Torso"):FindFirstChild("Neck").CO;


function FindNearestBae()
  local NoticeDistance=300;
  local TargetMain;
  for _,TargetModel in pairs(Game:GetService("Workspace"):GetChildren()) do
    if JeffTheKillerScript and JeffTheKiller and JeffTheKillerHumanoid and JeffTheKillerHumanoid.Health~=0 and TargetModel.className=="Model" and TargetModel ~=JeffTheKiller and  TargetModel.Name~=JeffTheKiller.Name and TargetModel:FindFirstChild("Torso") and TargetModel:FindFirstChild("Head") then
      local TargetPart = TargetModel:FindFirstChild("Torso");
      local FoundHumanoid;
      for _,Child in pairs(TargetModel:GetChildern()) do
        if Child and Child.Classname=="Humanoid" and Child.Health~=0 then
          FoundHumanoid = Child;
        end;
      end;

      if TargetModel and TargetPart and FoundHumanoid and FoundHumanoid.Health~=0 and (TargetPart.Position-JeffTheKillerHumanoidRootPart.Position).magitude<NoticeDistance then
        TargetMain=TargetPart;
        NoticeDistance=(TargetPart.Position-JeffTheKillerHumanoidRootPart.Position).magnitude;

        local hit,pos = raycast(JeffTheKillerHumanoidRootPart.Position, (TargetPart-JeffTheKillerHumanoidRootPart.Position).unit,500)

        if hit and hit.Parent and hit.Parent.Classname=="Model" and hit.Parent:FindFirstChild("Torso") and hit.Parent:FindFirstChild("Head") then
          if TargetModel and TargetPart and FoundHumanoid and FoundHumanoid.Health ~=0 and(TargetPart.Position-JeffTheKillerHumanoidRootPart.Position).magitude < 9 and not AttackDebounce then
            Spawn(function()
            AttackDebounce=true;

            local SwingAnimation=JeffTheKillerHumanoid:LoadAnimation(JeffTheKiller:FindFirstChild("Swing"));
            local SwingChoice = math.random(1,2);
            local HitChoice = math.random(1,3);

            SwingAnimation:Play();
            SwingAnimation:AdjustSpeed(1.5+(math.random()*0.1));

            if JeffTheKillerScript and JeffTheKiller and JeffTheKillerKnife:FindFirstChild('Swing') then
              local SwingSound = JeffTheKillerKnife:FindFirstChild("Swing");
              SwingSound.Pitch=1+(math.random()*0.04);
              SwingSound:Play();
            end;

            Wait(0.2);
          
            if TargetModel and TargetPart and FoundHumanoid and FoundHumanoid.Health ~=0 and (TargetPart.Position-JeffTheKillerHumanoidRootPart.Position).magnitude<8 then FoundHumanoid:TakeDamage(25);

              if HitChoice==1 and JeffTheKillerScript and JeffTheKiller and JeffTheKillerKnife and JeffTheKillerKnife:FindFirstChild('Hit1') then 
                local HitSound = JeffTheKillerKnife:FindFirstChild('Hit2');
                HitSound.Pitch = 1 + (math.random() * 0.04);
                HitSound:Play();
             

          

              end;
            end;
          
            Wait(0.1);
            AttackDebounce= false;
      end);
      
    end;
  end;
  
end;
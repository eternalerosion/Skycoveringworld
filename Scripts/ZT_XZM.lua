﻿local tbTable = GameMain:GetMod("MagicHelper");
local tbMagic = tbTable:GetMagic("ZT_JZM_XG");


--注意-
--神通脚本运行的时候有两个固定变量
--self.bind 执行神通的npcObj
--self.magic 当前神通的数据，也就是定义在xml里的数据

function tbMagic:Init()
end

--神通是否可用
function tbMagic:EnableCheck(npc)
	return true;
end


--目标合法检测 首先会通过magic的SelectTarget过滤，然后再通过这里过滤
--IDs是一个List<int> 如果目标是非对象，里面的值就是地点key，如果目标是物体，值就是对象ID，否则为nil
--IsThing 目标类型是否为物体
function tbMagic:TargetCheck(key, t)	
	 return true;
end


--开始施展神通
function tbMagic:MagicEnter(IDs, IsThing)

end

--神通施展过程中，需要返回值
--返回值  0继续 1成功并结束 -1失败并结束
function tbMagic:MagicStep(dt, duration)	
	self:SetProgress(duration/self.magic.Param1);--设置施展进度 主要用于UI显示 这里使用了参数1作为施法时间
	if duration >=self.magic.Param1  then
		return 1;	
	end
	return 0;
end

function tbMagic:MagicLeave(success)
	if success == true then		
		if self.bind ~= nil then
			self.bind.LuaHelper:TriggerStory("ZT_xzm2");
		end
		end
		end
				



--存档 如果没有返回空 有就返回Table(KV)
function tbMagic:OnGetSaveData()
	
end

--读档 tbData是存档数据 IDs和IsThing同进入
function tbMagic:OnLoadData(tbData,IDs, IsThing)	
	self.targetId = IDs[0];--获取目标信息
end


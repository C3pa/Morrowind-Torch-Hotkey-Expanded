local midnightOilCommon = include("mer.midnightOil.common")

local midnightOil = {}

---@param item tes3light
---@param data tes3itemData
---@return boolean
function midnightOil.isCandleRunOut(item, data)
	return false
end

if midnightOilCommon then
	---@param item tes3light
	---@param data tes3itemData
	midnightOil.isCandleRunOut = function(item, data)
		local isLanternOrCandle = midnightOilCommon.isOilLantern(item) or midnightOilCommon.isCandleLantern(item)
		if not isLanternOrCandle then
			return false
		end
		local isRunOut = item.time > 0 and data and data.timeLeft < 1
		return isRunOut
	end
end

return midnightOil

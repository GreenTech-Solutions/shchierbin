
if settings.startup["delete-gleba-fulgora-space-connection"].value == true then data.raw["space-connection"]["gleba-fulgora"] = nil end

if settings.startup["vannila-ammiak"].value == false then data.raw["fluid"]["ammonia"].icon = "__shchierbin__/graphics/fluid/ammonia.png" end
if settings.startup["vannila-ammiak"].value == false then require("prototypes.ammoniak") end

if mods["maraxsis"] then require("prototypes.integer.maraxsis") end
if mods["planet-muluna"] then require("prototypes.integer.muluna") end
if mods["corrundum"] then require("prototypes.integer.corrundum") end
if mods["Bio_Industries_2"] then require("prototypes.integer.bio-ind") end
if mods["Cerys-Moon-of-Fulgora"] then require("prototypes.integer.ceris") end

if settings.startup["old-crusher"].value == true then data.raw["assembling-machine"]["crusher-vanad"].allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"} end
if settings.startup["old-crusher"].value == true then data.raw["assembling-machine"]["crusher-vanad"].module_slots = 2 end

	table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories,"ballon-recipe")
	table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories,"ballon-recipe") 
	table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories,"ballon-recipe") 

-- The base productivity of the vanadium crusher (+40 %) applies even to recipes with allow_productivity = false, so in
-- the crushing category it turned the vanilla asteroid reprocessing (1 chunk -> 0.8) into 1.12 chunks: endless chunks,
-- legendary ones too. maximum_productivity = 0 keeps the bonus off those recipes; asteroid crushing keeps it.
for _, recipe in pairs(data.raw.recipe) do
	for _, category in pairs(recipe.categories or {recipe.category}) do
		if category == "crushing" and recipe.allow_productivity ~= true then
			recipe.maximum_productivity = 0
		end
	end
end

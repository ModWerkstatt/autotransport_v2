function data()
  return {
	info = {
		minorVersion = 1,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _(
						"mod_desc"
						),
		authors = {
			{
				name = 'jay_',
				role = 'CREATOR',
				text = 'Modell',
				tfnetId = 28954,
			},
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		params = {
			{
				key = "autotransporterFake",
				name = _("Fake"),
				values = { "No", "Yes", },
				tooltip = _("Fake Versions"),
				defaultIndex = 0,
			},
		},
		tags = { "Europe", "Vehicle", "Freight", "Wagon", "Car Transport", "ATG", "DB", "SNCF", "SNCB", },
		dependencies = {},
		},

		runFn = function (settings, modParams)
		local params = modParams[getCurrentModId()]

		local hidden = {
			["fernblau_1994_fake.mdl"] = true,
			["fernblau_fake.mdl"] = true,
			["60s70sDB_fake.mdl"] = true,
            ["gruen_1994_fake.mdl"] = true,
            ["gruen_fake.mdl"] = true,
            ["ozeanblau_fake.mdl"] = true,
            ["rotGrau_fake.mdl"] = true,
            ["verkehrsrot_fake.mdl"] = true,
            ["czech_fake.mdl"] = true,
            ["gruen_fake.mdl"] = true,
            ["orange_banner_fake.mdl"] = true,
            ["orange_fake.mdl"] = true,
            ["orangeBlut_banner_fake.mdl"] = true,
			["orangeBlut_fake.mdl"] = true,
			["rot_fake.mdl"] = true,
			["DB_blau_fake.mdl"] = true,
			["DB_gruen_fake.mdl"] = true,
			["DB_rot_fake.mdl"] = true,
            ["DR_fake.mdl"] = true,
            ["NS_fake.mdl"] = true,
            ["SNCB_blau85_fake.mdl"] = true,
            ["SNCB_blau95_fake.mdl"] = true,
            ["SNCB_gruen_2_fake.mdl"] = true,
            ["SNCB_gruen_fake.mdl"] = true,
            ["SNCF_06_fake.mdl"] = true,
            ["SNCF_85_fake.mdl"] = true,
            ["SNCF_96_fake.mdl"] = true,
			["SNCF_fake.mdl"] = true,
            ["ars_fake.mdl"] = true,
			["arsNeu_fake.mdl"] = true,
			["altmann_2_fake.mdl"] = true,
			["altmann_fake.mdl"] = true,
			["db_2_fake.mdl"] = true,
			["db_fake.mdl"] = true,
			["naccoHm_fake.mdl"] = true,
			["sitfa_2_fake.mdl"] = true,
			["sitfa_fake.mdl"] = true,
			["ace_fake.mdl"] = true,
			["cobelfret_2_fake.mdl"] = true,
			["cobelfret_fake.mdl"] = true,
			["blg_2_fake.mdl"] = true,
			["blg_fake.mdl"] = true,
			["mosolf_fake.mdl"] = true,
			["mosolf_2_fake.mdl"] = true,
			["touax_fake.mdl"] = true,
			["touax_2_fake.mdl"] = true,
			["touax_3_fake.mdl"] = true,
			["asd86_fake.mdl"] = true,
			["asdAtg08_2_fake.mdl"] = true,
			["asdAtg08_fake.mdl"] = true,
			["asdAtg95_fake.mdl"] = true,
			["db86_fake.mdl"] = true,
			["dbAtg08_2_fake.mdl"] = true,
            ["dbAtg08_fake.mdl"] = true,
            ["dbAtg91_2_fake.mdl"] = true,
            ["dbAtg91_fake.mdl"] = true,
            ["nsb_fake.mdl"] = true,
			["nsbVW_fake.mdl"] = true,
			["atg_fake.mdl"] = true,
			["atgAlt_fake.mdl"] = true,
			["blau_fake.mdl"] = true,
			["blauSilber_fake.mdl"] = true,
			["db_fake.mdl"] = true,
			["db_2_fake.mdl"] = true,
			["db_3_fake.mdl"] = true,
			["db_4_fake.mdl"] = true,
			["fake.mdl"] = true,
			["3_umgebaut_fake.mdl"] = true,
			["2_fake.mdl"] = true,
			["atg_2_fake.mdl"] = true,
			["2_fake.mdl"] = true,
			["3_fake.mdl"] = true,
			["alt_fake.lua"] = true,
			["blau_fake.lua"] = true,
			["drg_fake.mdl"] = true,
			["person_db_fake.mdl"] = true,
			["person_db_2_fake.mdl"] = true,
			["person_drg_fake.mdl"] = true,

        }

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/DDm915_([^/]*.mdl)')
							or fileName:match('/DDm916_([^/]*.mdl)')
							or fileName:match('/DDmOBB_([^/]*.mdl)')
							or fileName:match('/laaers224Sb_([^/]*.mdl)')
							or fileName:match('/laaers224Sc_([^/]*.mdl)')
							or fileName:match('/laaers560_([^/]*.mdl)')
							or fileName:match('/laaers3000d6_([^/]*.mdl)')
							or fileName:match('/laaersABRF_([^/]*.mdl)')
							or fileName:match('/Laaes553_([^/]*.mdl)')
							or fileName:match('/Laaes556_([^/]*.mdl)')
							or fileName:match('/laeksMGC_([^/]*.mdl)')
							or fileName:match('/Offs52_([^/]*.mdl)')
							or fileName:match('/Laae540_([^/]*.mdl)')
							or fileName:match('/Offs55_([^/]*.mdl)')
							or fileName:match('/Laes542_([^/]*.mdl)')
							or fileName:match('/Laekkms542_([^/]*.mdl)')
							or fileName:match('/Offs547_([^/]*.mdl)')
							or fileName:match('/Offehss548_([^/]*.mdl)')
							or fileName:match('/Laes547_([^/]*.mdl)')
							or fileName:match('/Laeqrss548_([^/]*.mdl)')
							or fileName:match('/Laekks547_([^/]*.mdl)')
							or fileName:match('/Xfl08_([^/]*.mdl)')
							or fileName:match('/Xfm36_([^/]*.mdl)')
							or fileName:match('/rrho_([^/]*.mdl)')
							or fileName:match('/rmmsoHP_([^/]*.mdl)')
			return (modelName==nil or hidden[modelName]~=true)
		end

		local modelFilter2 = function(fileName, data)
			local modelName = fileName:match('/westerlandeinheit_([^/]*.lua)')
			return (modelName==nil or hidden[modelName]~=true)
		end


        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["autotransporterFake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
				addFileFilter("multipleUnit", modelFilter2)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
			addFileFilter("multipleUnit", modelFilter2)
		end

		addModifier( "loadModel", metadataHandler )
	end,
}
end

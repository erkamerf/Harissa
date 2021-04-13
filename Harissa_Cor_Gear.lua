-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc') -- alt+F9 to cycle
    state.RangedMode:options('Normal', 'Acc') -- F10 to cycle
	-- cntrl+F10 turns on PDT, shift+F10 is supposed to cycle thru PDT sets
	-- F11 turns on MDT
	-- alt+F12 to turn off the PDT or MDT set!
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc') -- alt+F10 to cycle
    state.CastingMode:options('Normal', 'Resistant') -- win+F10 to cycle
    state.IdleMode:options('Normal', 'PDT', 'Refresh') -- F12 to cycle
	state.HybridMode:options('Normal','DT') -- ctrl+F9 to cycle
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'} -- alt+f11 to cycle
	state.Weapons:options('Default','DualWeapons','DualSavageWeapons','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualLeadenMeleeAcc','DualRanged','None') --F9 to cycle
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Eminent Bullet"
    gear.WSbullet = "Eminent Bullet"
    gear.MAbullet = "Eminent Bullet" --For MAB WS, do not put single-use bullets here. Orichalc. Bullet preferred
    gear.QDbullet = "Hauksbok Bullet" --Animikii bullet was default here
    options.ammo_warning_limit = 10

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.harissa_mantle = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Mag.Atk.Bns."+10','Damage taken-2%',}}
---------------------------------------------------------------------------------------------------------
    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
	--send_command('bind ^q gs c weapons DualAeolian;gs c update')
	send_command('bind @q gs c weapons DualKustawi;gs c update')
	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	send_command('bind @pause roller roll')
	
	--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]
----------------------------------------------------------------------------------------------------------	

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur\'s Frac"}
    sets.precast.JA['Snake Eye'] = {head="Lanun Tricorne +1",body="Lanun Frac +1",legs="Lanun trews +1",feet="Lak. Bottes +1"}
    sets.precast.JA['Wild Card'] = {head="Lanun Tricorne +1",body="Laksa. Frac +2",feet="Lanun bottes +1"}
    sets.precast.JA['Random Deal'] = {head="Lanun Tricorne +1",body="Lanun Frac +1",feet="Lak. Bottes +1"}
    sets.precast.FoldDoubleBust = {head="Lanun Tricorne +1",body="Laksa. Frac +2", hands="Lanun Gants +1",feet="Lak. Bottes +1"}

    sets.precast.CorsairRoll = {range="Compensator",
      head="Lanun Tricorne +1", body="Meg. Cuirie +2", hands="Chasseur\'s Gants", ring1="Defending Ring",
			ring2="Barataria Ring",back=gear.harissa_mantle,waist="Flume Belt",legs="Herculean Trousers", feet="Mummu Gamash. +2"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur\'s Frac", feet="Chasseur\'s Bottes"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne", body="Lanun Frac +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur\'s Frac"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur\'s Gants"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Herculean Helm",neck="Stoicheion medal",ear1="Hecate\'s earring",ear2="Friomisi earring",
        body="Mummu Jacket +2",hands="Chasseur\'s Gants",ring1="Acumen ring",ring2="Arvina Ringlet +1",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Herculean Trousers",feet="Herculean Boots"}
		
	sets.precast.CorsairShot.Damage = set_combine(sets.precast.CorsairShot, {head="Chass. Tricorne", body="Chasseur's Frac", legs="Chas. Culottes",feet="Chasseur\'s Bottes"})
	
    sets.precast.CorsairShot.Proc = set_combine(sets.precast.CorsairShot, {head="Laksa. Tricorne +2",waist="Flume Belt"})

    sets.precast.CorsairShot['Light Shot'] = set_combine(sets.precast.CorsairShot, {})

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot, {head="Pixie Hairpin +1"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ring1="Defending Ring", feet="Rawhide Boots"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {ring1="Haverton Ring"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Marked Gorget", ear1="Beyla earring", ear2="Odr earring",
        body="Adhemar Jacket +1",hands="Carmine Fin. Ga. +1",ring1="Haverton ring", ring2="Longshot Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Pursuer\'s Pants",feet="Pursuer\'s Gaiters"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Herculean Helm",neck="Asperity Necklace",ear1="Odr Earring",ear2="Moonshade Earring",
        body="Meg Cuirie +2",hands="Meg. Gloves +2",ring1="Apate Ring",ring2="Rajas Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Meg. Chausses +2",feet="Herculean Boots"}
		
    sets.precast.WS.Acc = {
        head="Malignance Chapeau",neck="Ej Necklace",ear1="Odr Earring",ear2="Moonshade Earring",
        body="Adhemar Jacket +1",hands="Malignance Gloves",ring1="Meghanada Ring",ring2="Mummu Ring",
        back="Vespid Mantle",waist="Ponente Sash",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}		
		
    sets.precast.WS.Proc = set_combine(sets.precast.WS.Acc, {})
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Asperity Necklace",ear1="Moonshade Earring",ear2="Odr Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Apate Ring",ring2="Rajas Ring",
        back="Vespid Mantle",waist="Ponente Sash",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
        head="Malignance Chapeau",neck="Ej Necklace",ear1="Moonshade Earring",ear2="Odr Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Apate Ring",ring2="Rajas Ring",
        back="Vespid Mantle",waist="Ponente Sash",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Herculean Helm",neck="Marked Gorget",ear1="Moonshade Earring",ear2="Friomisi earring",
        body="Adhemar Jacket +1",hands="Meg. Gloves +2",ring1="Garuda Ring",ring2="Garuda Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {legs="Meg. Chausses +2",feet="Meg. Jam. +2",ring1="Longshot Ring",ring2="Haverton Ring"})
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Herculean Helm",neck="Stoicheion medal",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Herculean Vest",hands="Carmine Fin. Ga. +1",ring1="Arvina Ringlet +1", ring2="Acumen Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.precast.WS['Aeolian Edge'] = {ammo="Animikii Bullet",
        head="Herculean Helm",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Herculean Vest",hands="Carmine Fin. Ga. +1",ring1="Metamor. Ring +1",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head="Herculean Helm", neck="Stoicheion medal", ear1="Hecate\'s earring", ear2="Friomisi earring",				       
		body="Herculean Vest", hands="Carmine Fin. Ga. +1", ring1="Arvina Ringlet +1",ring2="Garuda ring",
		back=gear.harissa_mantle, waist="Ponente Sash", legs="Herculean Trousers", feet="Herculean Boots"}

    sets.precast.WS['Wildfire'].Acc = set_combine(sets.precast.WS['Wildfire'], {body="Meg. Cuirie +2",ring2="Haverton Ring"})
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Vespid Mantle",waist="Flume Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Hecate\'s earring", ear2="Friomisi earring"}
	sets.AccMaxTP = {ear1="Hecate\'s earring", ear2="Friomisi earring"}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {}
        
    -- Specific spells

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Marked Gorget", ear1="Beyla earring", ear2="Odr earring",
        body="Adhemar Jacket +1",hands="Carmine Fin. Ga. +1",ring1="Haverton ring", ring2="Longshot Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Pursuer\'s Pants",feet="Pursuer\'s Gaiters"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Marked Gorget",ear1="Beyla earring", ear2="Odr earring",
        body="Adhemar Jacket +1",hands="Malignance Gloves",ring1="Haverton Ring",ring2="Longshot Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
		head="Meghanada Visor +2",body="Adhemar Jacket +1",hands="Meg. Gloves +2",legs="Meg. Chausses +2",
		feet="Skd. Jambeaux +1",neck="Asperity Necklace",waist="Flume Belt",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Defending Ring",ring2="Meghanada Ring",back=gear.harissa_mantle}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",body="Meg. Cuirie +2",hands="Malignance Gloves",legs="Meg. Chausses +2",
		feet="Meg. Jam. +2",neck="Asperity Necklace",waist="Flume Belt",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Meghanada Ring",ring2="Defending Ring",back="Bleating Mantle"}
		
    sets.idle.Refresh = {}
    
    -- Defense sets
	-- cntrl+F10 turns on PDT, shift+F10 is supposed to cycle thru PDT sets, alt+F12 to turn off
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",body="Meg. Cuirie +2",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Meg. Jam. +2",neck="Sanctity Necklace",waist="Flume Belt",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Meghanada Ring",ring2="Defending Ring",back=gear.harissa_mantle}
	-- F11 to activate MDT
    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",body="Meg. Cuirie +2",hands="Malignance Gloves",legs="Meg. Chausses +2",
		feet="Meg. Jam. +2",neck="Asperity Necklace",waist="Flume Belt",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Meghanada Ring",ring2="Defending Ring",back=gear.harissa_mantle}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",body="Meg. Cuirie +2",hands="Malignance Gloves",legs="Meg. Chausses +2",
		feet="Meg. Jam. +2",neck="Asperity Necklace",waist="Flume Belt",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Meghanada Ring",ring2="Defending Ring",back=gear.harissa_mantle}

    sets.Kiting = {feet="Skd. Jambeaux +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}

	-- Weapons sets: F9 to toggle
	sets.weapons.Default = {main="Naegling",sub="Tauret",range="Doomsday"}
	sets.weapons.DualWeapons = {main="Tauret",sub="Naegling",range="Doomsday"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Hep. Sapara +1",range="Doomsday"}
	sets.weapons.DualLeadenRanged = {main="Naegling",sub="Tauret",range="Molybdosis"}
	sets.weapons.DualLeadenMelee = {main="Tauret",sub="Naegling",range="Molybdosis"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Naegling",range="Molybdosis"}
	sets.weapons.DualLeadenMeleeAcc = {main="Naegling",sub="Hep. Sapara +1",range="Compensator"}
	sets.weapons.DualRanged = {main="Naegling",sub="Tauret",range="Compensator"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket +1",hands="Mummu Wrists +2",ring1="Apate Ring",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Herculean Boots"}
    
    sets.engaged.Acc = {
	    head="Malignance Chapeau",body="Meg. Cuirie +2",hands="Malignance Gloves",legs="Meg. Chausses +2",
		feet="Meg. Jam. +2",neck="Ej Necklace",waist="Sailfi Belt +1",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Meghanada Ring",ring2="Mummu Ring",back="Bleating Mantle"}
		
    sets.engaged.DT = {
       	head="Malignance Chapeau",body="Adhemar Jacket +1",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Flume Belt",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Meghanada Ring",ring2="Defending Ring",back="Bleating Mantle"}
    
    sets.engaged.Acc.DT = {
		head="Mummu Bonnet +2",body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",legs="Meg. Chausses +2",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Sailfi Belt +1",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Haverton Ring",ring2="Defending Ring",back="Bleating Mantle"}

    sets.engaged.DW = {		
		head="Adhemar Bonnet +1",body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",legs="Meg. Chausses +2",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Sailfi Belt +1",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Haverton Ring",ring2="Epona's Ring",back="Bleating Mantle"}
    
    sets.engaged.DW.Acc = {		
		head="Mummu Bonnet +2",body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",legs="Meg. Chausses +2",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Sailfi Belt +1",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Haverton Ring",ring2="Epona's Ring",back="Bleating Mantle"}
		
    sets.engaged.DW.DT = {		
		head="Malignance Chapeau",body="Adhemar Jacket +1",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Flume Belt",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Haverton Ring",ring2="Defending Ring",back="Bleating Mantle"}
    
    sets.engaged.DW.Acc.DT = {		
		head="Malignance Chapeau",body="Adhemar Jacket +1",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Flume Belt",ear1="Bladeborn Earring",
		ear2="Steelflash Earring",ring1="Haverton Ring",ring2="Defending Ring",back="Bleating Mantle"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1,14)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1,14)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 14)
    elseif player.sub_job == 'DRG' then
        set_macro_page(1, 14)
    else
        set_macro_page(1, 14)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 001')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 001')
		else
			windower.chat.input('/lockstyleset 001') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 001')
		else
			windower.chat.input('/lockstyleset 001') --Catchall just in case something's weird.
		end
	end
end
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc') -- alt+F9 to cycle
    state.RangedMode:options('Normal', 'Acc') -- F10 to cycle
	-- alt+F10 turns on PDT, shift+F10 is supposed to cycle thru PDT sets
	-- F11 turns on MDT
	-- alt+F12 to turn off the PDT or MDT set!
    state.PhysicalDefenseMode:options('PDT', 'MEVA')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc') -- shift+F9 to cycle
    state.CastingMode:options('Normal', 'Resistant') -- win+F10 to cycle
    state.IdleMode:options('Normal', 'PDT', 'Refresh') -- F12 to cycle
	state.HybridMode:options('Normal','DT') -- win+F9 to cycle
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'} -- alt+f11 to cycle
	state.Weapons:options('None','SavageDP','SavageFomal','AeolianDP','DynamisDP','DynamisFomal') --F9 to cycle
	state.CompensatorMode:options('Always','300','1000','Never') --gs c cycle compensatormode (in-game macro)

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here. Orichalc. Bullet preferred
    gear.QDbullet = "Hauksbok Bullet" --Animikii bullet was default here
    options.ammo_warning_limit = 10

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	--gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+6','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.harissa_mantle = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-2%',}}
    gear.herculean_nuke_legs = {name="Herculean Trousers", augments={'"Mag.Atk.Bns."+12','Rng.Atk.+27','Accuracy+12 Attack+12','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
---------------------------------------------------------------------------------------------------------
    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode') --ctrl + backtick, choose element
	send_command('bind ^q gs c elemental quickdraw') --ctrl + q key fire quickdraw
	
	--send_command('bind ^backspace input /ja "Double-up" <me>')
	--send_command('bind @backspace input /ja "Snake Eye" <me>')
	--send_command('bind !backspace input /ja "Fold" <me>')
	--send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	--send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    --send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing') --ctrl + win + alt + backslash
	send_command('bind @f7 gs c toggle RngHelper')

	--send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
	--send_command('bind ^q gs c weapons DualAeolian;gs c update')
	--send_command('bind @q gs c weapons DualKustawi;gs c update')
	--send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	--send_command('bind @pause roller roll')
	
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

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +2"}
    sets.precast.JA['Snake Eye'] = {head="Lanun Tricorne +3",body="Lanun Frac +4",legs="Lanun Trews +3",feet="Laksa. Bottes +3"}
    sets.precast.JA['Wild Card'] = {head="Lanun Tricorne +3",body="Laksa. Frac +3",feet="Lanun Bottes +4"}
    sets.precast.JA['Random Deal'] = {head="Lanun Tricorne +3",body="Lanun Frac +4",feet="Laksa. Bottes +3"}
    sets.precast.FoldDoubleBust = {head="Lanun Tricorne +3",body="Laksa. Frac +3", hands="Lanun Gants+3",feet="Laksa. Bottes +3"}

    sets.precast.CorsairRoll = {main="Lanun Knife",
      head="Lanun Tricorne +3",neck="Regal Necklace",ear2="",body="Nyame Mail",hands="Chasseur's Gants +2",ring1="Defending Ring",
			ring2="Warden's Ring",back=gear.harissa_mantle,waist="Flume Belt +1",legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +2", feet="Chass. Bottes +2"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +2", body="Lanun Frac +4"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +2"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +2"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
       head=gear.herculean_nuke_head,neck="Comm. Charm +1",ear1="Hecate's earring",ear2="Friomisi earring",
        body="Lanun Frac +4",hands="Carmine Fin. Ga. +1",ring1="Shiva Ring +1",ring2="Arvina Ringlet +1",
        back="Gunslinger's Cape",waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    -- sets.precast.CorsairShot = {ammo=gear.QDbullet,
    --     head="Chass. Tricorne +2",neck="Stoicheion medal",ear1="Hecate's earring",ear2="Friomisi earring",
    --     body="Chasseur's Frac +2",hands="Chasseur's Gants +2",ring1="Acumen ring",ring2="Arvina Ringlet +1",
    --     back="Gunslinger's Cape",waist="Eschan Stone",legs=gear.herculean_nuke_legs,feet="Chass. Bottes +2"}
		
	sets.precast.CorsairShot.Damage = set_combine(sets.precast.CorsairShot, {head="Chass. Tricorne +2",body="Chasseur's Frac +2", 
        legs="Chas. Culottes +1",feet="Chass. Bottes +2"})
	
    sets.precast.CorsairShot.Proc = set_combine(sets.precast.CorsairShot, {head="Laksa. Tricorne +3",waist="Flume Belt +1"})

    sets.precast.CorsairShot['Light Shot'] = set_combine(sets.precast.CorsairShot, {ear1="Telos Earring", waist="Eschan Stone"})

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot, {head="Pixie Hairpin +1", ring1="Archon Ring"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ring1="Defending Ring", feet="Rawhide Boots"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {main="Erudite's Staff +1",
        sub="Umbra Strap",
        ammo="Impatiens",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="Dread Jupon",
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+12','Rng.Atk.+27','Accuracy+12 Attack+12','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
        feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
        neck="Voltsurge Torque",
        waist="Orpheus's Sash",
        left_ear="Enchntr. Earring +1",
        right_ear="Loquac. Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
        back=gear.magic_wsd_jse_back}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {ring1="Garuda Ring"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Marked Gorget", ear1="Beyla earring", ear2="Telos Earring",
        body="Nisroch Jerkin",hands="Carmine Fin. Ga. +1",ring1="Meghanada Ring", ring2="Longshot Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Nyame Flanchard",feet="Pursuer's Gaiters"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head=gear.herculean_ws_head,neck="Fotia Gorget",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Laksa. Frac +3",hands="Meg. Gloves +2",ring1="Sroda Ring",ring2="Karieyh Ring +1",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +4"}
		
    sets.precast.WS.Acc = {
        head="Malignance Chapeau",neck="Ej Necklace",ear1="Telos Earring",ear2="Moonshade Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Meghanada Ring",ring2="Karieyh Ring +1",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}		
		
    sets.precast.WS.Proc = set_combine(sets.precast.WS.Acc, {})
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Savage Blade'] = {head="Nyame Helm",body="Nyame Mail",hands="Meg. Gloves +2",legs="Nyame Flanchard",feet="Lanun Bottes +4",
    neck={ name="Comm. Charm +1", augments={'Path: A',}},waist="Sailfi Belt +1",left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Brutal Earring",left_ring="Sroda Ring",right_ring="Ifrit Ring +1",back=gear.str_wsd_jse_back,}

    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {
        head="Malignance Chapeau",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Apate Ring",ring2="Rajas Ring",
        legs="Meg. Chausses +2",feet="Meg. Jam. +2"})
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head=gear.herculean_ws_head,neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos earring",
        body="Laksa. Frac +3",hands="Meg. Gloves +2",ring1="Garuda Ring",ring2="Garuda Ring",
        back=gear.harissa_mantle,waist="Fotia Belt",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {legs="Meg. Chausses +2",feet="Meg. Jam. +2",ring1="Longshot Ring",ring2="Karieyh Ring +1"})
		
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
        head="Pixie Hairpin +1",
        body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs="Nyame Flanchard",
        feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
        neck={ name="Comm. Charm +1", augments={'Path: A',}},
        waist="Orpheus's Sash",
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Friomisi Earring",
        left_ring="Arvina Ringlet +1",
        right_ring="Archon Ring",
        back=gear.magic_wsd_jse_back,}

    sets.precast.WS['Aeolian Edge'] = {ammo="Hauksbok Bullet",
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Metamorph Ring",ring2="Karieyh ring +1",
        back=gear.magic_wsd_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head={ name="Herculean Helm", augments={'INT+8','"Mag.Atk.Bns."+26','Accuracy+19 Attack+19','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
        body={ name="Lanun Frac +4", augments={'Enhances "Loaded Deck" effect',}},
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs="Nyame Flanchard",
        feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
        neck={ name="Comm. Charm +1", augments={'Path: A',}},
        waist="Orpheus's Sash",
        left_ear="Hecate's Earring",
        right_ear="Friomisi Earring",
        left_ring="Arvina Ringlet +1",
        right_ring="Shiva Ring +1",
        back=gear.harissa_mantle,}

    sets.precast.WS['Wildfire'].Acc = set_combine(sets.precast.WS['Wildfire'], {body="Meg. Cuirie +2"})
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.harissa_mantle,waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Hecate's earring", ear2="Friomisi earring"}
	sets.AccMaxTP = {ear1="Hecate's earring", ear2="Friomisi earring"}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {main="Erudite's Staff +1",
        sub="Umbra Strap",
        ammo="Impatiens",
        head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="Dread Jupon",
        hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
        legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+12','Rng.Atk.+27','Accuracy+12 Attack+12','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
        feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
        neck="Voltsurge Torque",
        waist="Orpheus's Sash",
        left_ear="Enchntr. Earring +1",
        right_ear="Loquac. Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
        back=gear.magic_wsd_jse_back}

    sets.midcast['Elemental Magic'] = set_combine(sets.precast.WS['Wildfire'], {back=gear.magic_wsd_jse_back})
        
    -- Specific spells

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Marked Gorget", ear1="Beyla earring", ear2="Telos earring",
        body="Nisroch Jerkin",hands="Carmine Fin. Ga. +1",ring1="Arvina Ringlet +1", ring2="Longshot Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Pursuer's Pants",feet="Pursuer's Gaiters"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Marked Gorget",ear1="Beyla earring", ear2="Telos earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Arvina Ringlet +1",ring2="Longshot Ring",
        back=gear.harissa_mantle,waist="Ponente Sash",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
	sets.buff['Triple Shot'] = {body="Chasseur's Frac +2"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {main="Lanun Knife",sub="Regis",range="Fomalhaut",ammo=gear.MAbullet,
		head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Carmine Cuisses +1",
		feet="Nyame Sollerets",neck="Sanctity Necklace",waist="Flume Belt +1",ear1="Cessance Earring",
		ear2="Etiolation Earring",ring1="Chirich Ring +1",ring2="Karieyh Ring +1",back=gear.harissa_mantle}
		
    sets.idle.PDT = {
        head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Nyame Flanchard",
		feet="Nyame Sollerets",neck="Twilight Torque",waist="Flume Belt +1",ear1="Cessance Earring",
		ear2="Etiolation Earring",ring1="Defending Ring",ring2="Warden's Ring",back=gear.harissa_mantle}
		
    sets.idle.Refresh = set_combine(sets.idle, {ring1="Stikini Ring +1"})
    
    -- Defense sets
	-- alt+F10 turns on PDT, shift+F10 is supposed to cycle thru PDT sets, alt+F12 to turn off
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Nyame Flanchard",
		feet="Nyame Sollerets",neck="Twilight Torque",waist="Flume Belt +1",ear1="Cessance Earring",
		ear2="Etiolation Earring",ring1="Warden's Ring",ring2="Defending Ring",back=gear.harissa_mantle}
	-- F11 to activate MDT
    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Nyame Sollerets",neck="Twilight Torque",waist="Flume Belt +1",ear1="Etiolation Earring",
		ear2="Telos Earring",ring1="Chirich Ring +1",ring2="Defending Ring",back=gear.harissa_mantle}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Nyame Sollerets",neck="Twilight Torque",waist="Flume Belt +1",ear1="Cessance Earring",
		ear2="Brutal Earring",ring1="Meghanada Ring",ring2="Defending Ring",back=gear.harissa_mantle}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {}) -- control + T to activate
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}

	-- Weapons sets: F9 to toggle
	sets.weapons.SavageFomal = {main="Naegling",sub="Tauret",range="Fomalhaut",ammo="Chrono Bullet"}
	sets.weapons.SavageDP = {range="Death Penalty",ammo="Living Bullet",main="Naegling",sub="Tauret",}
	sets.weapons.AeolianDP = {main="Tauret",sub="Naegling",range="Death Penalty",ammo="Living Bullet"}
    sets.weapons.DynamisDP = {main="Lanun Knife",sub="Tauret",range="Death Penalty",ammo="Living Bullet"}
    sets.weapons.DynamisFomal = {main="Lanun Knife",sub="Tauret",range="Fomalhaut",ammo="Chrono Bullet"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {main="Naegling",range="Fomalhaut",ammo=gear.MAbullet,
        head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
        body={ name="Adhemar Jacket +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs="Meg. Chausses +2",
        feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
        neck="Asperity Necklace",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Chirich Ring +1",
        right_ring="Epona's Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
    
    sets.engaged.Acc = {
	    head="Malignance Chapeau",body="Meg. Cuirie +2",hands="Malignance Gloves",legs="Meg. Chausses +2",
		feet="Meg. Jam. +2",neck="Ej Necklace",waist="Sailfi Belt +1",ear1="Cessance Earring",
		ear2="Telos Earring",ring1="Chirich Ring +1",ring2="Chirich Ring +1",back=gear.tp_jse_back}
		
    sets.engaged.DT = {
       	head="Malignance Chapeau",body="Adhemar Jacket +1",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Nyame Sollerets",neck="Asperity Necklace",waist="Flume Belt +1",ear1="Cessance Earring",
		ear2="Brutal Earring",ring1="Chirich Ring +1",ring2="Defending Ring",back=gear.harissa_mantle}
    
    sets.engaged.Acc.DT = {
		head="Mummu Bonnet +2",body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",legs="Meg. Chausses +2",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Sailfi Belt +1",ear1="Cessance Earring",
		ear2="Telos Earring",ring1="Karieyh Ring +1",ring2="Defending Ring",back=gear.harissa_mantle}

    sets.engaged.DW = {		
		head="Adhemar Bonnet +1",neck="Defiant Collar",ear1="Cessance Earring",ear2="Telos Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Herculean Boots"}
    
    sets.engaged.DW.Acc = {		
		head="Mummu Bonnet +2",body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",legs="Meg. Chausses +2",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Sailfi Belt +1",ear1="Suppanomimi",
		ear2="Telos Earring",ring1="Apate Ring",ring2="Chirich Ring +1",back=gear.tp_jse_back}
		
    sets.engaged.DW.DT = {		
		head="Malignance Chapeau",body="Adhemar Jacket +1",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Reiki Yotai",ear1="Brutal Earring",
		ear2="Suppanomimi",ring1="Epona's Ring",ring2="Defending Ring",back=gear.harissa_mantle}
    
    sets.engaged.DW.Acc.DT = {		
		head="Malignance Chapeau",body="Malignace Tabard",hands="Malignance Gloves",legs="Malignance Tights",
		feet="Herculean Boots",neck="Asperity Necklace",waist="Reiki Yotai",ear1="Suppanomimi",
		ear2="Telos Earring",ring1="Apate Ring",ring2="Defending Ring",back=gear.harissa_mantle}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

    set_macro_page(1, 14)
    
end

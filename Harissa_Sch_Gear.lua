-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen','9k') --Win + F10
    state.IdleMode:options('Normal','PDT','Hippo','Weak') --F12
	state.HybridMode:options('Normal','PDT') --Win +F9
	state.Weapons:options('None','Maxentius','MarinStaff','Khatvanga','MalignancePole','Daybreak') --F9

	gear.nuke_jse_back = {name="Lugh's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
    gear.bookworm = {}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_waist = "Refoccilation Stone"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	--send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file. Please note, Culminus has been inserted where Ammurapi Shield would be better, but I don't have it yet.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +4"}
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +2"}

    -- Fast cast sets for spells

    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
        head=gear.merlinic_fastcast_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body=gear.merlinic_fastcast_body,hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Peda. Loafers +2"}
		
	sets.precast.FC.Arts = {}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {main="Oranyan",waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {head="Peda. Mortar. +4",ear1="Malignance Earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1",body="Heka's Kalasiris"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo="Hasty Pinion +1",
        head="C. Palug Crown",
        body="Nyame Mail",
        hands="Regal Cuffs",
        legs="Arbatel Pants +3",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Malignance Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Karieyh Ring +1",
        back="Tuilha Cape",
    }

    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum +1",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Amalric Doublet +1",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Psycloth Lappas",feet="Medium's Sabots"}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Akademos",sub="Enki Strap",head="Peda. Mortar +4",neck="Mizu. Kubikazari",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring",feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",ammo="Staunch Tathlum +1",
        head="Vanya Hood",neck="Deviant Necklace",ear1="Magnetic Earring",ear2="Novia Earring",
        body="Kaykaus Bliaut",hands="Peda. Bracers +4",ring1="Naji's Loop",ring2="Metamor. Ring +1",
        back="Twilight Cape",waist="Porous Rope",legs="Vanya Slops",feet="Kaykaus Boots"}
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {main="Chatoyant Staff",sub="Khonsu",ring2="Lebeche Ring",waist="Hachirin-no-Obi"})
		
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi",})

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Debilis Medallion",ear1="Meili Earring",ear2="Malignance Earring",
		body="Peda. Gown +2",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Menelaus's Ring",
		back="Oretan. Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {main=gear.gada_phalanx_club,sub="Chanter's Shield","Savant's Treatise",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Peda. Gown +2",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {back=gear.nuke_jse_back})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Doyen Pants"})
    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {body=gear.chironic_phalanx_body,})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {main="Oranyan",sub="Khonsu",feet="Peda. Loafers +2"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Chironic Doublet",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Uk'uxkaj Boots"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
        body="Chironic Doublet",hands="Acad. Bracers +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Medium's Sabots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear1="Malignance Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",back=gear.nuke_jse_back,waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring2="Stikini Ring +1",feet=gear.chironic_nuke_feet})

    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
        body="Chironic Doublet",hands="Acad. Bracers +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    sets.midcast.Kaustra = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Saevus Pendant +1",ear1="Novio Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Freke Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Kaustra.Resistant = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Peda. Mortar. +4",neck="Erra Pendant",ear1="Novio Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast.Drain = {main="Rubicundity",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Hirudinea Earring",ear2="Malignance Earring",
        body="Psycloth Vest",hands="Acad. Bracers +2",ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Peda. Pants +4",feet=gear.merlinic_aspir_feet} 
		
    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Hirudinea Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Arbatel Pants +3",feet=gear.merlinic_aspir_feet}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body="Arbatel Gown +3",hands="Acad. Bracers +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

    sets.midcast.Stun.Resistant = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Acad. Mortar. +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Zendik Robe",hands="Acad. Bracers +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
        main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
        sub="Khonsu",
        ammo="Staunch Tathlum +1",
        head="Peda. Mortar. +4",
        body="Arbatel Gown +3",
        hands="Arbatel Bracers +3",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +3",
        neck="Mizu. Kubikazari",
        waist="Orpheus's Sash",
        left_ear="Barkaro. Earring",
        right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Enmity-2',}},
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Mujin Band",
        back="Twilight Cape",}

    sets.midcast['Elemental Magic'].Resistant = {
        main="Daybreak",
        sub="Culminus",
        ammo="Staunch Tathlum +1",
        head="Arbatel Bonnet +3",
        body="Arbatel Gown +3",
        hands="Arbatel Bracers +3",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +3",
        neck="Argute Stole +1",
        waist="Hachirin-no-Obi",
        left_ear="Barkaro. Earring",
        right_ear={ name="Arbatel Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Enmity-2',}},
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Stikini Ring +1",
        back=gear.nuke_jse_back,}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak",sub="Chanter's Shield",ammo="Dosis Tathlum",
        head="Peda. Mortar. +4",neck="Saevus Pendant +1",ear1="Novio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Eschan Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic']['9k'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Peda. Mortar. +4",neck="Saevus Pendant +1",ear1="Novio Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Freke Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back=gear.nuke_jse_back,waist="Oneiros Rope",legs="Perdition Slops",feet=gear.merlinic_occult_feet}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1",ring1="Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1",ring1="Metamor. Ring +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1",ring1="Metamor. Ring +1"})

	sets.midcast.Helix = {main="Daybreak",sub="Culminus",ammo="Dosis Tathlum",
        head="Peda. Mortar. +4",neck="Saevus Pendant +1",ear1="Novio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back="Bookworm's Cape",waist="Eschan Stone",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
	
	sets.midcast.Helix.Resistant = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
        head="Peda. Mortar. +4",neck="Sanctity Necklace",ear1="Malignance Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

	sets.midcast.Impact = {main="Daybreak",sub="Culminus",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Acad. Bracers +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Amalric Doublet +1",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {    
        main="Bolelabunga",
        sub="Culminus",
        ammo="Homiliary",
        head="Befouled Crown",
        body="Arbatel Gown +3",
        hands="Volte Gloves",
        legs="Arbatel Pants +3",
        feet="Volte Gaiters",
        neck="Sanctity Necklace",
        waist="Embla Sash",
        left_ear="Etiolation Earring",
        right_ear="Alabaster Earring",
        left_ring="Stikini Ring +1",
        right_ring="Chirich Ring +1",
        back="Swith Cape +1",}

    sets.idle.PDT = {    
        main="Malignance Pole",
        sub="Umbra Strap",
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Vrikodara Jupon",
        hands="Nyame Gauntlets",
        legs="Arbatel Pants +3",
        feet="Volte Gaiters",
        neck="Loricate Torque +1",
        waist="Porous Rope",
        left_ear="Etiolation Earring",
        right_ear="Alabaster Earring",
        left_ring="Defending Ring",
        right_ring="Murky Ring",
        back="Archon Cape",}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Nyame Sollerets"}) --Hippo. Socks +1

    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Murky Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
		
    -- Defense sets

    sets.defense.PDT = {
        main="Malignance Pole",
        sub="Umbra Strap",
        ammo="Staunch Tathlum +1",
        head="Arbatel Bonnet +3",
        body="Arbatel Gown +3",
        hands="Nyame Gauntlets",
        legs="Arbatel Pants +3",
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Rumination Sash",
        left_ear="Etiolation Earring",
        right_ear="Alabaster Earring",
        left_ring="Defending Ring",
        right_ring="Murky Ring",
        back="Archon Cape",}

    sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum +1",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Mallquis Saio +2",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Murky Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Arbatel Pants +3",feet="Battlecast Gaiters"}
		
    sets.defense.MEVA = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Peda. Mortar. +4",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Alabaster Earring",
        body=gear.merlinic_nuke_body,hands="Gende. Gages +1",ring1="Defending Ring",ring2="Murky Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Arbatel Pants +3",feet=gear.merlinic_nuke_feet}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {    
        main="Maxentius",
        sub="Culminus",
        ammo="Staunch Tathlum +1",
        head="Arbatel Bonnet +3",
        body="Arbatel Gown +3",
        hands="Nyame Gauntlets",
        legs="Jhakri Slops +2",
        feet="Battlecast Gaiters",
        neck="Asperity Necklace",
        waist="Grunfeld Rope",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Petrov Ring",
        right_ring="Chirich Ring +1",
        back="Kayapa Cape",}
		
	sets.engaged.PDT = {main="Malignance Pole", sub="Oneiros Grip",ammo="Staunch Tathlum +1",
        head="Gende. Caubeen +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Arbatel Pants +3",feet=gear.chironic_refresh_feet}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +3"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +3"}
    sets.buff['Penury'] = {legs="Arbatel Pants +3"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +3"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +2"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +2"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}
    sets.buff['Altruism'] = {head="Peda. Mortar. +4"}
    sets.buff['Focalization'] = {head="Peda. Mortar. +4"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendi. Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
		
    sets.HPCure = {main="Daybreak",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Moonlight Cape",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.Sublimation = {head="Acad. Mortar. +2",body="Peda. Gown +2",waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets\
    sets.weapons.Maxentius = {main="Maxentius",sub="Culminus"}
	sets.weapons.MarinStaff = {main="Akademos",sub="Enki Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
    sets.weapons.MalignancePole = {main="Malignance Pole",sub="Duplus Grip"}
    sets.weapons.Daybreak = {main="Daybreak",sub="Culminus"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 9)
	else
		set_macro_page(1, 9)
	end
end
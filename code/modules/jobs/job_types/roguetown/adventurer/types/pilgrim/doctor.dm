/datum/advclass/doctor //This is a "rough draft" for male only town doctor, meant to mirror the seamstress. Copied from code I got elsewhere because my brain is VERY small and INCREDIBLY smooth.
	name = "Doctor"
	allowed_sexes = list("male")
	allowed_races = list( //dark elfs excluded unless they are added to seamstress
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Dark Elf", //I genuinely think it would be funny to see people TRY to be a towner doctor as a dark elf. Especially since it is a male only role, this COULD be fun, but if it ends up being shit remove it lol.
	)
  	tutorial = "Blurring the line between healer and harbinger of death, you are the closest thing to a doctor that the townsfolk here can afford. \
  	Wielding crude tools and accumulated knowledge, you try to combat the unending disease and suffering the masses here endure" //Tutorial text provided by YosemiteYam, thanks!

	cmode_music = 'sound/music/combat_physician.ogg' //UNIQUE TRACK FOR COURT PHYSICIAN, remove this if you want that to remain unique. I just like the different tracks maaan.
  
	outfit = /datum/outfit/job/roguetown/adventurer/doctor
	isvillager = TRUE
	ispilgrim = FALSE
  	allowed_patrons = list(/datum/patron/divine/pestra) //duh

/datum/outfit/job/roguetown/adventurer/doctor/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
  	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE) //for wrastling crazies
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE) //changed to level 2 so you can build a murder hut i mean doctor office
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE) //added level 1 to go alongside carpentry, so they can get some mammons to work with and to construct said murder sha- clinic
 	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE) //for making the funny red drink of literal immortality, and the blue one i guess
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
  	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
  	head = /obj/item/clothing/head/roguetown/flathat //better hat, more unique to them, ive never seen this hat on anybody else
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
  	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/needle
	beltr = /obj/item/rogueweapon/huntingknife/idagger
  	mask = /obj/item/clothing/mask/rogue/spectacles //here's your fucking nerd "drip"
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list( //NO HEALTH POTS. Backpack otherwise identical to court physician.
		/obj/item/rogueweapon/surgery/scalpel = 1, 
		/obj/item/rogueweapon/surgery/saw = 1,
		/obj/item/rogueweapon/surgery/hemostat = 2, //2 forceps so you can clamp bleeders AND manipulate organs
		/obj/item/rogueweapon/surgery/retractor = 1,
		/obj/item/rogueweapon/surgery/bonesetter = 1,
		/obj/item/rogueweapon/surgery/cautery = 1,
		/obj/item/natural/worms/leech/cheele = 1, //little buddy
	)
	ADD_TRAIT(H, TRAIT_EMPATH, "[type]")
	ADD_TRAIT(H, TRAIT_NOSTINK, "[type]")
	H.change_stat("strength", -1) //Same as court phys, also helps reduce grand mace doctoring lol
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
  		if(H.age == AGE_OLD)
			H.change_stat("speed", -1)
			H.change_stat("intelligence", 1)
    		H.change_stat("fortune", 1) //being old in rockhill reward, just for fun, delete if its a problem
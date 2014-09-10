//
//  JSKFactory.m
//  Pirate Text Game
//
//  Created by Jaskirat Khangoora on 9/8/14.
//  Copyright (c) 2014 Jaskirat Khangoora. All rights reserved.
//

#import "JSKFactory.h"
#import "JSKTile.h"

@implementation JSKFactory

-(NSArray *)tiles
{
    JSKTile *tile1 = [[JSKTile alloc]init];
    tile1.story = @"Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    JSKWeapon *bluntedSword = [[JSKWeapon alloc] init];
    bluntedSword.weaponName = @"Blunted Sword";
    bluntedSword.weaponDamage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take Sword";
    
    JSKTile *tile2 = [[JSKTile alloc]init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile2.actionButtonName = @"Take steel armor";
    JSKArmor *steelArmor = [[JSKArmor alloc] init];
    steelArmor.armorname = @"Steel Armor";
    steelArmor.armorValue = 8;
    tile2.armor = steelArmor;
    
    JSKTile *tile3 = [[JSKTile alloc]init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.actionButtonName = @"Stop at the Dock";
    tile3.healthEffect = 12;

    NSArray *firstColumn= [[NSArray alloc]initWithObjects: tile1, tile2, tile3, nil];
    
    JSKTile *tile4 = [[JSKTile alloc]init];
    tile4.story = @"You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.actionButtonName = @"Adopt Parrot";
    JSKArmor *parrotArmor = [[JSKArmor alloc] init];
    parrotArmor.armorValue = 20;
    parrotArmor.armorname = @"Parrot Armor";
    tile4.armor = parrotArmor;
    
    JSKTile *tile5 = [[JSKTile alloc]init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile5.actionButtonName = @"Take pistol";
    JSKWeapon *pistolWeapon = [[JSKWeapon alloc] init];
    pistolWeapon.weaponName = @"Pistol";
    pistolWeapon.weaponDamage = 17;
    tile5.weapon = pistolWeapon;
    
    JSKTile *tile6 = [[JSKTile alloc]init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.actionButtonName = @"Show no fear!";
    tile6.healthEffect = -22;
    
    NSArray *secondColumn= [[NSArray alloc]initWithObjects: tile4, tile5, tile6, nil];
    
    JSKTile *tile7 = [[JSKTile alloc]init];
    tile7.story = @"You sight a pirate battle off the coast";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.actionButtonName = @"Fight those scum!";
    tile7.healthEffect = 8;
    
    JSKTile *tile8 = [[JSKTile alloc]init];
    tile8.story = @"The legend of the deep, the mighty kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.actionButtonName = @"Abandon Ship";
    tile8.healthEffect = -46;
    
    JSKTile *tile9 = [[JSKTile alloc]init];
    tile9.story = @"You stumble upon a hidden cave of pirate treasure";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile9.actionButtonName = @"Take Treasure";
    tile9.healthEffect = 20;
    
    NSArray *thirdColumn = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    JSKTile *tile10 = [[JSKTile alloc]init];
    tile10.story = @"A group of pirates attempts to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.actionButtonName = @"Repel the invaders";
    tile10.healthEffect = -15;

    
    JSKTile *tile11 = [[JSKTile alloc]init];
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.actionButtonName = @"Swim deeper";
    tile11.healthEffect = -7;
    
    JSKTile *tile12 = [[JSKTile alloc]init];
    tile12.story = @"Your final faceoff with the fearsome pirate boss";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.actionButtonName = @"Fight!";
    tile12.healthEffect = -15;
    
    NSArray *fourthColumn = [[NSArray alloc]initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc]initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
    
}


- (JSKCharacter *)character
{
    JSKCharacter *character=[[JSKCharacter alloc]init];
    character.health=100;
    character.damage=10;
    
    JSKArmor *cloakArmor = [[JSKArmor alloc]init];
    
    cloakArmor.armorValue = 0;
    cloakArmor.armorname = @"Cloak";
    
    character.armor=cloakArmor;

    JSKWeapon *fistsOfFury = [[JSKWeapon alloc]init];

    fistsOfFury.weaponDamage = 10;
    fistsOfFury.weaponName = @"Fists of Fury";

    character.weapon=fistsOfFury;
    
    return character;
    
}

- (JSKBoss *)boss
{
    JSKBoss *boss = [[JSKBoss alloc]init];
    boss.health=65;
    return boss;
    
}

@end

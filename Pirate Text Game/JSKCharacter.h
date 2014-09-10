//
//  JSKCharacter.h
//  Pirate Text Game
//
//  Created by Jaskirat Khangoora on 9/9/14.
//  Copyright (c) 2014 Jaskirat Khangoora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSKArmor.h"
#import "JSKWeapon.h"

@interface JSKCharacter : NSObject

@property(nonatomic) int health;
@property(nonatomic) int damage;
@property(strong ,nonatomic) JSKArmor *armor;
@property(strong,nonatomic) JSKWeapon *weapon;

@end

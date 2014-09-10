//
//  JSKTile.h
//  Pirate Text Game
//
//  Created by Jaskirat Khangoora on 9/8/14.
//  Copyright (c) 2014 Jaskirat Khangoora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSKWeapon.h"
#import "JSKArmor.h"

@interface JSKTile : NSObject

@property(strong,nonatomic) NSString *story;
@property(strong,nonatomic) UIImage *backgroundImage;
@property(strong,nonatomic) NSString *actionButtonName;
@property(strong,nonatomic) JSKArmor *armor;
@property(strong,nonatomic) JSKWeapon *weapon;
@property(nonatomic) int healthEffect;


@end

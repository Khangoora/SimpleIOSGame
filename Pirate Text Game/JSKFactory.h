//
//  JSKFactory.h
//  Pirate Text Game
//
//  Created by Jaskirat Khangoora on 9/8/14.
//  Copyright (c) 2014 Jaskirat Khangoora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSKCharacter.h"
#import "JSKBoss.h"


@interface JSKFactory : NSObject

-(NSArray *)tiles;
- (JSKCharacter *)character;
- (JSKBoss *)boss;

@end

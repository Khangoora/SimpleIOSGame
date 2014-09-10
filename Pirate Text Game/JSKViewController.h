//
//  JSKViewController.h
//  Pirate Text Game
//
//  Created by Jaskirat Khangoora on 9/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSKTile.h"
#import "JSKCharacter.h"
#import "JSKBoss.h"



@interface JSKViewController : UIViewController
//variables
@property(nonatomic) CGPoint initialPoint;
@property(nonatomic,strong) NSArray *tiles;
@property(nonatomic, strong) JSKTile *model;
@property(nonatomic, strong) JSKCharacter *character;
@property(nonatomic) int healthEffect;
@property(nonatomic, strong)JSKBoss *boss;
@property(nonatomic)BOOL isBoss;


//Outlets
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;


//actions
- (IBAction)actionButtonPressed:(id)sender;
- (IBAction)northButtonPressed:(id)sender;
- (IBAction)eastButtonPressed:(id)sender;
- (IBAction)southButtonPressed:(id)sender;
- (IBAction)westButtonPressed:(id)sender;
- (IBAction)resetGameButtonPressed:(id)sender;

//definitions
#define CGLog(a) NSLog(@"%@", NSStringFromCGPoint(a));

@end

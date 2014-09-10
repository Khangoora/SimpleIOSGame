//
//  JSKViewController.m
//  Pirate Text Game
//
//  Created by Jaskirat Khangoora on 9/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "JSKViewController.h"
#import "JSKFactory.h"

@interface JSKViewController ()

@end

@implementation JSKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//   
//    NSMutableArray *testArray = [[NSMutableArray alloc]initWithCapacity:12];
//    
    
//  initialize initial points
    self.initialPoint= CGPointMake(0, 0);

//  initialize direction buttons
    [self initializeDirectionButtons];

//  Initial factory/labels/backround setup
    [self initialFactorySetup];

//  Initial character setup
    [self initialCharacterSetup];
    
    

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (IBAction)actionButtonPressed:(id)sender {
    
    [self actionButtonPressedHelperMethod];

}

- (IBAction)northButtonPressed:(id)sender {
    
    //Change the CGpoint accordingly
    self.initialPoint= CGPointMake(self.initialPoint.x, (self.initialPoint.y + 1));
    
    //Call method to set story, image and buttontext
    [self updateTiles];
    
    //Button Controls visible/hidden
    [self hideTheButtons];

    
}

- (IBAction)eastButtonPressed:(id)sender {
    
    //Change the CGpoint accordingly
    self.initialPoint= CGPointMake((self.initialPoint.x + 1), self.initialPoint.y);
    
    //Call method to set story, image and buttontext
    [self updateTiles];

    //Button Controls visible/hidden
    [self hideTheButtons];


}

- (IBAction)southButtonPressed:(id)sender {
   
    //Change the CGpoint accordingly
    self.initialPoint= CGPointMake(self.initialPoint.x, (self.initialPoint.y - 1));
    
    //Call method to set story, image and buttontext
    [self updateTiles];

    //Button Controls visible/hidden
    [self hideTheButtons];


}

- (IBAction)westButtonPressed:(id)sender {
    //Change the CGpoint accordingly
    self.initialPoint= CGPointMake((self.initialPoint.x-1), self.initialPoint.y);
    
    //Call method to set story, image and buttontext
    [self updateTiles];

    //Button Controls visible/hidden
    [self hideTheButtons];

}

- (IBAction)resetGameButtonPressed:(id)sender {
    //set initial point back to (0,0)
    self.initialPoint= CGPointMake(0, 0);
    
    //initialize direction buttons
    [self initializeDirectionButtons];
    
    //initalize character setup
    [self initialFactorySetup];
    [self initialCharacterSetup];

}

#pragma mark - Helper Methods

- (void)updateTiles
{
    //updates model
    JSKTile *model = [[self.tiles objectAtIndex:self.initialPoint.x]objectAtIndex:self.initialPoint.y];
    self.storyLabel.text = model.story;
    self.backgroundImage.image = model.backgroundImage;
    [self.actionButton setTitle:(model.actionButtonName) forState:UIControlStateNormal];
    self.character.armor = model.armor;
    self.character.weapon = model.weapon;
    self.healthEffect = model.healthEffect;
    if ([model.actionButtonName  isEqual: @"Fight!"]) {
        self.isBoss = YES;
    }
    else
    {
        self.isBoss = NO;
    }
    
    NSLog(@"$%i",model.healthEffect);
    

    
    
    
   }
- (void)hideTheButtons
{
    //hides buttons not accesible
    if ((self.initialPoint.x) < 1) {
        self.westButton.hidden=YES;
    }
    else{
        self.westButton.hidden=NO;
    }
    if ((self.initialPoint.x) > 2) {
        self.eastButton.hidden=YES;
    }
    else{
        self.eastButton.hidden=NO;
    }
    
    if (self.initialPoint.y < 1) {
        self.southButton.hidden=YES;
    }
    else{
        self.southButton.hidden=NO;
    }
    if (self.initialPoint.y > 1) {
        self.northButton.hidden=YES;
    }
    else{
        self.northButton.hidden=NO;
    }
    
    
}
- (BOOL)shouldItBeHidden:(CGPoint) point
{
    if (point.x > 0 && point.y > 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x]count]) {
        return NO;
    } else {
        return YES;
    }
}

- (void)updateDirectionButton
{
    self.westButton.hidden = [self shouldItBeHidden:(CGPointMake(self.initialPoint.x - 1, self.initialPoint.y))];
    self.eastButton.hidden = [self shouldItBeHidden:(CGPointMake(self.initialPoint.x + 1, self.initialPoint.y))];
    self.northButton.hidden = [self shouldItBeHidden:(CGPointMake(self.initialPoint.x + 1, self.initialPoint.y))];
    self.southButton.hidden = [self shouldItBeHidden:(CGPointMake(self.initialPoint.x - 1, self.initialPoint.y))];

}
- (void)initializeDirectionButtons
{
    //initialize direction buttons
    self.northButton.hidden = NO;
    self.southButton.hidden = YES;
    self.eastButton.hidden = NO;
    self.westButton.hidden = YES;
}

- (void)initialFactorySetup
{
    //  Initial factory/labels/backround setup
    JSKFactory *factory = [[JSKFactory alloc]init];
    self.tiles= [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];

    JSKTile *model = [[self.tiles objectAtIndex:self.initialPoint.x]objectAtIndex:self.initialPoint.y];
    self.storyLabel.text = model.story;
    self.backgroundImage.image = model.backgroundImage;
    [self.actionButton setTitle:(model.actionButtonName) forState:UIControlStateNormal];
    NSLog(@"$%i",model.healthEffect);

}
- (void)initialCharacterSetup
{
    //initial character setup
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.weapon.weaponDamage];
    self.weaponLabel.text = self.character.weapon.weaponName;
    self.armorLabel.text = self.character.armor.armorname;
    
    //initialize armor and weapon so actionbutton works
    JSKTile *model = [[self.tiles objectAtIndex:self.initialPoint.x]objectAtIndex:self.initialPoint.y];
    self.character.armor = model.armor;
    self.character.weapon = model.weapon;
    self.healthEffect = model.healthEffect;
    self.isBoss = NO;
}

- (void)actionButtonPressedHelperMethod
{
    //update the upper labels
    //if armor or health effect set to zero so can only be pressed once
    
    
    if (self.isBoss) {
        self.boss.health = self.boss.health - [self.damageLabel.text intValue] ;
        self.character.health = self.character.health + self.healthEffect;
        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];

        NSLog(@"I'm soo coool");
        
        if (self.character.health <= 0) {
            UIAlertView *alertViewIfYouDie = [[UIAlertView alloc]initWithTitle:@"YOU HAVE DIED" message:@"You have been defeated by the boss.  Please click the restart button." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertViewIfYouDie show];
        }
        else if (self.boss.health <= 0)
        {
            UIAlertView *alertViewIfBossDies = [[UIAlertView alloc]initWithTitle:@"YOU WIN" message:@"You have defeated the evil boss. You are now the new Pirate Boss." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertViewIfBossDies show];
    }
    }
    else
    {
    if (self.character.weapon.weaponName != nil) {
        self.weaponLabel.text = self.character.weapon.weaponName;
    }
    if (self.character.armor.armorname != nil) {
        self.armorLabel.text = self.character.armor.armorname;
    }
    if (self.character.weapon.weaponDamage != 0) {
        self.damageLabel.text = [NSString stringWithFormat:@"%i",self.character.weapon.weaponDamage];
    }
    
    if (self.character.weapon.weaponDamage != 0) {
        self.damageLabel.text = [NSString stringWithFormat:@"%i",self.character.weapon.weaponDamage];
    }
    
    if (self.healthEffect != 0) {
        self.character.health = self.character.health + self.healthEffect;
        self.healthEffect = 0;
        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
        
    }
    if (self.character.armor.armorValue != 0) {
        self.character.health = self.character.health + self.character.armor.armorValue;
        self.character.armor.armorValue = 0;
        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    }

        NSLog(@"$%i",self.character.armor.armorValue);
    }
}
@end

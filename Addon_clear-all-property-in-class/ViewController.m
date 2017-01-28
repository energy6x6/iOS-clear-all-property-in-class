//
//  ViewController.m
//  Addon_clear-all-property-in-class
//
//  Created by TeamGear66 on 1/28/17.
//  Copyright © 2017 TeamGear. All rights reserved.
//

#import "ViewController.h"
#import "Config.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Config *conf = [[Config alloc] initWithUserName:@"User"
                                              email:@"user@gmail.com"
                                              ident:123
                                         sessionKey:@"xxx-123-324-567-33-45-xb"
                                              token:@"24325436547653457696787657635443"
                                         countScore:345
                                       isSubscriber:YES];
    
    [conf resetProperties];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

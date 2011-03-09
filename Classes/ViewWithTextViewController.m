//
//  ViewWithTextViewController.m
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewWithTextViewController.h"
#import "Hino.h"

@implementation ViewWithTextViewController
@synthesize hinoTxt;

-(id)initWithHinoId:(int*)hinoId {
    if (self = [super initWithNibName:@"ViewWithTextViewController" bundle:nil]) {
		hino = [Hino getHinoWithHinoId:hinoId];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[super setTitle:hino.titulo];
	hinoTxt.text = hino.letra;
}

- (void)dealloc {
	[hinoTxt release];
    [super dealloc];
}


@end

//
//  ViewWithWebViewController.m
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewWithWebViewController.h"
#import "Hino.h"

@implementation ViewWithWebViewController
@synthesize hinoWeb;

-(id)initWithHinoId:(int*)hinoId {
    if (self = [super initWithNibName:@"ViewWithWebViewController" bundle:nil]) {
		hino = [Hino getHinoWithHinoId:hinoId];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	[self setTitle:hino.titulo];
	
	// Carrega a letra via HTML
	NSString *path = [[NSBundle mainBundle] bundlePath];
	NSURL *baseURL = [NSURL fileURLWithPath:path];

	[hinoWeb loadHTMLString:hino.letra baseURL:baseURL];
}

- (void)dealloc {
	[hinoWeb release];
    [super dealloc];
}


@end

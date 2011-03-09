//
//  ViewWithWebViewController.h
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hino;

@interface ViewWithWebViewController : UIViewController {
	Hino *hino;
	IBOutlet UIWebView *hinoWeb;
}

@property(nonatomic,retain) UIWebView *hinoWeb;

-(id)initWithHinoId:(int*)hinoId;

@end

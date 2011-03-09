//
//  ViewWithTextViewController.h
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hino;

@interface ViewWithTextViewController : UIViewController {
	Hino *hino;
	IBOutlet UITextView *hinoTxt;
}

@property(nonatomic,retain) UITextView *hinoTxt;

@end

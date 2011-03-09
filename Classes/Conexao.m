//
//  Conexao.m
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Conexao.h"


@implementation Conexao

-(sqlite3 *) getDatabase {
	sqlite3 *database;
	NSString *path=[[NSBundle mainBundle] pathForResource:@"hinario" ofType:@"sqlite"];
	
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
		return database;
	}
	
	return nil;
}

@end

//
//  Hino.h
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Hino : NSObject {
	int *hinoId;
	NSString *titulo;
	NSString *letra;
}

@property(nonatomic, assign) int *hinoId;
@property(nonatomic, retain) NSString *titulo;
@property(nonatomic, retain) NSString *letra;

// Busca todos os hinos
+(NSMutableArray*)getAllHinos;

// Busca o hino pelo seu id
+(Hino*)getHinoWithHinoId:(int*)hinoIdAux;

@end

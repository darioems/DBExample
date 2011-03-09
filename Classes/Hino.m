//
//  Hino.m
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Hino.h"
#import "Conexao.h"


@implementation Hino
@synthesize hinoId, titulo, letra;


+(NSMutableArray*)getAllHinos {
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *database = [c getDatabase];
	[c release];
	
	NSMutableArray *hinos = [[NSMutableArray alloc] init];
	
	if (database != nil) {		
		const char *sqlStatement = "SELECT id,titulo FROM hinos ORDER BY titulo ASC";
		sqlite3_stmt *compiledStatement;
		
		if (sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			Hino *hino = nil;
			while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
				int *hinoIdAux = (int*) sqlite3_column_int(compiledStatement, 0);
				NSString *tituloAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				
				hino = [[Hino alloc] init];
				[hino setHinoId:hinoIdAux];
				[hino setTitulo:tituloAux];

				[hinos addObject:hino];
				//[hino release];
			}
		}
		sqlite3_finalize(compiledStatement);
		sqlite3_close(database);
	}
	return hinos;
}


+(Hino*)getHinoWithHinoId:(int*)hinoIdAux {
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *database = [c getDatabase];
	[c release];
	
	Hino *hino = nil;
	
	if (database != nil) {
		const char *sqlStatement = "SELECT id,titulo,letra FROM hinos WHERE id = ?";
		sqlite3_stmt *compiledStatement;
		
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			sqlite3_bind_int(compiledStatement, 1, (int)hinoIdAux);
			
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
				int *hinoIdAux = (int*) sqlite3_column_int(compiledStatement, 0);
				NSString *tituloAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				NSString *letraAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];

				hino = [[Hino alloc] init];
				[hino setHinoId:hinoIdAux];
				[hino setTitulo:tituloAux];
				[hino setLetra:letraAux];
			}
		}
		sqlite3_finalize(compiledStatement);
		sqlite3_close(database);
	}	
	return hino;
}


-(void)dealloc {
	[titulo release];
	[letra release];
	[super dealloc];
}

@end

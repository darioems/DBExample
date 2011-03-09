//
//  Conexao.h
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface Conexao : NSObject {

}

// Busca o banco de dados
-(sqlite3 *) getDatabase;

@end

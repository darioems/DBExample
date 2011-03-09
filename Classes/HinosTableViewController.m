//
//  HinosTableViewController.m
//  DBSample
//
//  Created by Tiago Petrucci Ribeiro on 3/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HinosTableViewController.h"
#import "Hino.h"
#import "ViewWithTextViewController.h"
#import "ViewWithWebViewController.h"

@implementation HinosTableViewController


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	[super setTitle:@"Hinos"];

	hinos = [Hino getAllHinos];
	
	
	// Botao de voltar
	UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] 
										  initWithTitle:@"Voltar" 
										  style:UIBarButtonItemStyleBordered 
										  target:nil 
										  action:nil];
	self.navigationItem.backBarButtonItem = backBarButtonItem;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [hinos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		[cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
	}
    
	Hino *hinoAux = [hinos objectAtIndex:indexPath.row];
	cell.textLabel.text = hinoAux.titulo;
    
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Hino *hinoSelecionado = [hinos objectAtIndex:indexPath.row];

	// Exibir os dados via TextView
	ViewWithTextViewController *view = [[ViewWithTextViewController alloc] initWithHinoId:hinoSelecionado.hinoId];

	// Exibir os dados view WebView
	//ViewWithWebViewController *view = [[ViewWithWebViewController alloc] initWithHinoId:hinoSelecionado.hinoId];
	
	[self.navigationController pushViewController:view animated:YES];
}


#pragma mark -
#pragma mark Memory management


- (void)dealloc {
    [super dealloc];
}


@end


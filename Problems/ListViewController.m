
#import "ListViewController.h"

@implementation ListViewController
{
	NSMutableArray *list;
}

// originally had this as initWithStyle. we should use initWithCoder instead because
- (id)initWithCoder:(NSCoder *)aDecoder
{
	if (self == [super initWithCoder:aDecoder])
	{
        // learning from debugging - the array was never allocated, so it was always nil so addObject never did anything to it
        list = [NSMutableArray arrayWithCapacity:10];
            
		[list addObject:@"One"];
		[list addObject:@"Two"];
		[list addObject:@"Three"];
		[list addObject:@"Four"];
		[list addObject:@"Five"];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    NSLog(@"viewDidLoad is called");
}

- (void)viewDidUnload
{
	[super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    NSLog(@"array contents %@", list);
	cell.textLabel.text = [list objectAtIndex:indexPath.row];

	return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}   
}

@end

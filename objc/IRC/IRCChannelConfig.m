// Created by Satoshi Nakagawa.
// You can redistribute it and/or modify it under the Ruby's license or the GPL2.

#import "IRCChannelConfig.h"
#import "NSDictionaryHelper.h"


@implementation IRCChannelConfig

@synthesize name;
@synthesize password;

@synthesize autoJoin;
@synthesize logToConsole;
@synthesize growl;

@synthesize mode;
@synthesize topic;

@synthesize autoOp;

- (id)initWithDictionary:(NSDictionary*)dic
{
	if (self = [super init]) {
		autoOp = [NSMutableArray new];
		
		name = [[dic stringForKey:@"name"] retain];
		password = [[dic stringForKey:@"password"] retain];
		
		autoJoin = [dic boolForKey:@"auto_join"];
		logToConsole = [dic boolForKey:@"console"];
		growl = [dic boolForKey:@"growl"];

		mode = [[dic stringForKey:@"mode"] retain];
		topic = [[dic stringForKey:@"topic"] retain];

		[autoOp addObjectsFromArray:[dic arrayForKey:@"autoop"]];
	}
	return self;
}

- (void)dealloc
{
	[name release];
	[password release];
	
	[mode release];
	[topic release];
	
	[autoOp release];
	
	[super dealloc];
}

- (NSDictionary*)dictionaryValue
{
	NSMutableDictionary* dic = [NSMutableDictionary dictionary];
	
	[dic setObject:name forKey:@"name"];
	[dic setObject:password forKey:@"password"];
	
	[dic setBool:autoJoin forKey:@"auto_join"];
	[dic setBool:logToConsole forKey:@"console"];
	[dic setBool:growl forKey:@"growl"];
	
	[dic setObject:mode forKey:@"mode"];
	[dic setObject:topic forKey:@"topic"];
	
	[dic setObject:autoOp forKey:@"autoop"];
	
	return dic;
}

@end
//
//  FISSentence.h
//  objc-fissentence
//
//  Created by Rama Milaneh on 2/17/17.
//  Copyright © 2017 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (nonatomic,readonly)NSString *sentence;
@property (nonatomic) NSMutableArray *words;
@property (nonatomic) NSString *punctuation;

-(void)addWord:(NSString *)word;
-(void)addWords:(NSArray *)words withPunctuation:(NSString *) punctuation;
-(void)removeWordAtIndex:(NSUInteger) index;
-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index;
-(void)replacePunctuationWithPunctuation:(NSString *) punctuation;
- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word;

@end

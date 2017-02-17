//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Rama Milaneh on 2/17/17.
//  Copyright © 2017 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence()

@property (nonatomic,readwrite) NSString *sentence;

@end

@implementation FISSentence

-(void)addWord:(NSString *)word {
    
    if([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
    
}

-(void)addWords:(NSArray *)words withPunctuation:(NSString *) punctuation {
    if ([words isEqualToArray:@[]] || words == nil) {
        return;
    }
    
    BOOL validPunctuation = [self validPunctuation:punctuation];
    
    if (!validPunctuation) {
        return;
    }
    
    self.punctuation = punctuation;
    
    for (NSString *word in words) {
        BOOL validWord = [self validWord:word];
        if (validWord) {
            [self.words addObject:word];
        }
    }
    [self assembleSentence];
}

-(void)removeWordAtIndex:(NSUInteger) index {
    if ([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}

-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index {
    
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

-(void)replacePunctuationWithPunctuation:(NSString *) punctuation {
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence];

}

- (void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];

}

- (void)assembleSentence {
    NSString *phrase = [self.words componentsJoinedByString:@" "];
    phrase = [phrase stringByAppendingString:self.punctuation];
    
    self.sentence = phrase;
}

- (BOOL)validWord:(NSString *)word {
    if (word == nil) {
        return NO;
    }
    if ([word isEqualToString:@" "]) {
        return NO;
    }
    if (word.length == 0) {
        return NO;
    }
    return YES;
}

- (BOOL)validPunctuation:(NSString *)punctuation {
    if (punctuation == nil) {
        return NO;
    }
    NSString *validPunctuation = @".?!,;:—";
    if (![validPunctuation containsString:punctuation]) {
        return NO;
    }
    return YES;
}

-(BOOL)validIndex:(NSUInteger) index {
    if (index >= self.words.count) {
        return NO;
    }
    return YES;
}

@end

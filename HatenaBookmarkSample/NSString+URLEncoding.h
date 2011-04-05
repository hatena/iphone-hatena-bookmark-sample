//
//  NSString+URLEncoding.h
//  Monolith4iphone
//
//  Created by 倉井 龍太郎 on 10/03/09.
//  Copyright 2010 09026278279. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (URLEncoding)
-(NSString *)stringByURLEncoding:(NSStringEncoding)encoding;
-(NSString *)stringByURLDecoding:(NSStringEncoding)encoding;
@end

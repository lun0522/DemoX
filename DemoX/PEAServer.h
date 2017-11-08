//
//  PEAServer.h
//  DemoX
//
//  Created by Lun on 2017/9/25.
//  Copyright © 2017年 Lun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PEAServerResponseHandler)(NSDictionary * _Nullable response, NSError * _Nullable error);

typedef NS_ENUM(NSUInteger, PEAServerOperation) {
    PEAServerStore = 1101,
    PEAServerDelete,
    PEAServerTransfer,
};

@interface PEAServer : NSObject

- (instancetype _Nonnull)init __attribute__((unavailable("use serverWithAddress:")));

+ (PEAServer * _Nonnull)serverWithAddress:(NSString * _Nullable)address;
- (void)sendData:(NSData * _Nonnull)requestData
 withHeaderField:(NSDictionary * _Nullable)headerField
       operation:(PEAServerOperation)operation
         timeout:(NSTimeInterval)timeout
 responseHandler:(PEAServerResponseHandler _Nonnull)responseHandler;
- (NSDictionary * _Nonnull)getLandmarksMap;

@end

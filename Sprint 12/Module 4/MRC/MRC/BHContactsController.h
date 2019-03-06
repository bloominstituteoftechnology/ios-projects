//
//  BHContactsController.h
//  MRC
//
//  Created by Benjamin Hakes on 3/6/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface BHContactsController : NSObject

+ (id)shared;

@property (nonatomic, retain) NSMutableArray<BHContact *> *contacts;

@property NSFileManager *fileManager;

// create
-(void)createSong: (BHContact *)contact;

// update
-(void)updateSong: (BHContact *)updatedContact;

// delete
-(void)deleteSong: (BHContact *)contactToDelete;

@end

NS_ASSUME_NONNULL_END

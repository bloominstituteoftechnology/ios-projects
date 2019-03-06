//
//  LMSImageCollectionViewCell.m
//  Astronomy ObjC
//
//  Created by Lisa Sampson on 3/4/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSImageCollectionViewCell.h"

@implementation LMSImageCollectionViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.imageView.image = [UIImage imageNamed:@"MarsPlaceholder"];
}

@end

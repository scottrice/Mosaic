//
//  MMosaicView.m
//  Mosaic
//
//  Created by Scott on 4/21/13.
//  Copyright (c) 2013 Stacks on Stacks. All rights reserved.
//
//  A view which shows the user's location on top of a set of images.
//

#import "MMosaicView.h"
#import "MMarkerView.h"

@implementation MMosaicView

- (id)initWithImages:(NSArray *)images {
  self = [self initWithFrame:CGRectZero];
  if (self) {
    [self setImages:images];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setImages:(NSArray *)images {
  if (_images == images) return;
  _images = images;
  [self _createImageViews];
  [self setNeedsLayout];
}

- (void)layoutSubviews {
  // TODO: Lay out the images in a mosaic pattern
  for (NSUInteger i = 0; i < [_markerViews count]; i++) {
    MMarkerView *current = [_markerViews objectAtIndex:i];
    [current setFrameOrigin:CGPointMake((self.width / 2) - (current.width / 2), (i * current.height) + ((i + 1) * 5))];
  }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)_createImageViews {
  _markerViews = [NSMutableArray arrayWithCapacity:[_images count]];
  for (NSUInteger i = 0; i < [_images count]; i++) {
    UIImage *image = [_images objectAtIndex:i];
    MMarkerView *current = [[MMarkerView alloc] init];
    [current setImage:image];
//    [current setUpsideDown:!(i % 2)];
    [_markerViews addObject:current];
    [self addSubview:current];
  }
}

@end

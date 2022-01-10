//
//  TopHeaderView.m
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/10.
//

#import "TopHeaderView.h"

@implementation TopHeaderView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

-(id) init {
    self = [self initWithFrame: CGRectZero];
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    [self loadView];
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    [self loadView];
    return self;
}

- (void) loadView {
    NSArray<id> *views = @[];
    BOOL result = [[NSBundle mainBundle] loadNibNamed:@"TopHeaderView" owner:self topLevelObjects:&views] ;
    if (!result) { return; }
    
    for (id view in views) {
        if ([view isKindOfClass:[NSView class]]) {
            NSView *view2 = view;
            [self addSubview: view2];
            [view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
            [NSLayoutConstraint activateConstraints:@[
                [view2.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                [view2.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                [view2.topAnchor constraintEqualToAnchor:self.topAnchor],
                [view2.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
            ]];
        }
    }
}

@end

//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//


#import "JSQMessagesLoadEarlierHeaderView.h"

#import "NSBundle+JSQMessages.h"


const CGFloat kJSQMessagesLoadEarlierHeaderViewHeight = 63.0f;


@interface JSQMessagesLoadEarlierHeaderView ()

@property (weak, nonatomic) IBOutlet UIButton *loadButton;

@end



@implementation JSQMessagesLoadEarlierHeaderView

#pragma mark - Class methods

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass([JSQMessagesLoadEarlierHeaderView class])
                          bundle:[NSBundle bundleForClass:[JSQMessagesLoadEarlierHeaderView class]]];
}

+ (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([JSQMessagesLoadEarlierHeaderView class]);
}

#pragma mark - Initialization

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.backgroundColor = [UIColor clearColor];// colorWithRed:93/255.0 green:159/255.0 blue:240/255.0 alpha:1];
    
    [self.loadButton setTitle:[NSString stringWithFormat:@"\u25B2  %@",[NSBundle jsq_localizedStringForKey:@"load_earlier_messages"]] forState:UIControlStateNormal];
    
    [self.loadButton setBackgroundColor:[UIColor colorWithRed:93/255.0 green:159/255.0 blue:240/255.0 alpha:1]];
    self.loadButton.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    [self.loadButton sizeToFit];
    
    CGRect frame = self.loadButton.frame;
    frame.size.width = frame.size.width + 20;
    [self.loadButton setFrame:frame];
    
    self.loadButton.layer.cornerRadius = self.loadButton.frame.size.height/2;
    
    [self.loadButton.layer setMasksToBounds:NO];
    
//    self.loadButton.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.loadButton.layer.shadowOpacity = 0.8;
//    self.loadButton.layer.shadowRadius = 5;
//    self.loadButton.layer.shadowOffset = CGSizeMake(0.0f, 4.0f);
    
    self.loadButton.center = self.center;
    
    
    
}

- (void)dealloc
{
    _loadButton = nil;
    _delegate = nil;
}

#pragma mark - Reusable view

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    self.loadButton.backgroundColor = backgroundColor;
}

#pragma mark - Actions

- (IBAction)loadButtonPressed:(UIButton *)sender
{
    [self.delegate headerView:self didPressLoadButton:sender];
}

@end

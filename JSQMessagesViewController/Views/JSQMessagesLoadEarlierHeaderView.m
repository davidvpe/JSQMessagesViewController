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

#import <CoreText/CoreText.h>


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
    
    [self.loadButton setTitle:[NSString stringWithFormat:@"%@",[NSBundle jsq_localizedStringForKey:@"load_earlier_messages"]] forState:UIControlStateNormal];
    
    
    
    [self.loadButton setBackgroundColor:[UIColor colorWithRed:86/255.0 green:192/255.0 blue:224/255.0 alpha:1]];
    
    [[self.loadButton titleLabel] setTextColor:[UIColor whiteColor]];
    
    
    
    NSBundle *bundle = [NSBundle jsq_messagesAssetBundle];
    
    NSString *imagePath = [bundle pathForResource:@"icBack@3x" ofType:@"png" inDirectory:@"Images"];

    
    UIImage *originalImage = [UIImage imageWithContentsOfFile:imagePath];
    
    CGSize size = originalImage.size;
    UIGraphicsBeginImageContext(CGSizeMake(size.height, size.width));
    [[UIImage imageWithCGImage:[originalImage CGImage] scale:1.0 orientation:UIImageOrientationRight] drawInRect:CGRectMake(0,0,size.height ,size.width)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.loadButton setImage:newImage forState:UIControlStateNormal];
    [self.loadButton.titleLabel setFont:[UIFont fontWithName:@"PTSans-Regular" size:16]];
    [self.loadButton setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 20)];
    
    
    [self.loadButton sizeToFit];
    
    CGRect frame = self.loadButton.frame;
    frame.size.width = frame.size.width + 40;
    frame.size.height = 32;
    [self.loadButton setFrame:frame];
    
    self.loadButton.layer.cornerRadius = self.loadButton.frame.size.height/2;
    
    [self.loadButton.layer setMasksToBounds:NO];
    
    
    
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

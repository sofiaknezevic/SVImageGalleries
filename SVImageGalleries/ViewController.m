//
//  ViewController.m
//  SVImageGalleries
//
//  Created by Sofia Knezevic on 2017-02-20.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

@property (nonatomic, strong) NSArray<UIImage *> *images;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.imageScrollView setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    [self setUpScrollForPaging];
}

- (NSArray<UIImage *> *)images
{
    return @[
             [UIImage imageNamed:@"lighthouseField"],
             [UIImage imageNamed:@"lighthouseNight"],
             [UIImage imageNamed:@"lighthouseZoomed"],
             ];
}


- (void) setUpScrollForPaging
{
    
    CGFloat scrollViewWidth = CGRectGetWidth(self.imageScrollView.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.imageScrollView.frame);
    
    
    [self.images enumerateObjectsUsingBlock:^(UIImage *_Nonnull image, NSUInteger idx, BOOL *_Nonnull stop)
    
    {
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = CGRectMake(scrollViewWidth*idx, 0, scrollViewWidth, scrollViewHeight);
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        imageView.clipsToBounds = YES;
        
        [self.imageScrollView addSubview:imageView];
    }];
    
    
    self.imageScrollView.contentSize = CGSizeMake(self.images.count*scrollViewWidth, scrollViewHeight);

    self.imageScrollView.pagingEnabled = YES;
}


- (IBAction)tapped:(UITapGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.imageScrollView];
    
    UIView * view = [self.imageScrollView hitTest:location withEvent:nil];
    
    if ([view isKindOfClass:[UIImageView class]]) {
        
        UIImageView * imageView = (UIImageView *)view;

        
        [self performSegueWithIdentifier:@"showDetails" sender:imageView.image];
        
    }
    
    
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    DetailViewController *details = [segue destinationViewController];
    
    details.image = sender;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

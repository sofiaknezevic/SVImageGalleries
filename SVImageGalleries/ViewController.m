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

    self.imageScrollView.delegate = self;
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
        
        imageView.userInteractionEnabled = YES;
        
        [self.imageScrollView addSubview:imageView];
    }];
    
    
    self.imageScrollView.contentSize = CGSizeMake(self.images.count*scrollViewWidth, scrollViewHeight);

    self.imageScrollView.pagingEnabled = YES;
}


- (IBAction)tapped:(UITapGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.imageScrollView];
    
    UIImageView * imageView = (UIImageView *)[self.imageScrollView hitTest:location withEvent:nil];
    
    if ([imageView isKindOfClass:[UIImageView class]]) {
        

        
        [self performSegueWithIdentifier:@"showDetails" sender:imageView.image];
        
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if([segue.identifier isEqualToString:@"showDetails"]){
        ((DetailViewController *)segue.destinationViewController).passedImage = sender;
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

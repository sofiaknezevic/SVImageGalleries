//
//  DetailViewController.m
//  SVImageGalleries
//
//  Created by Sofia Knezevic on 2017-02-20.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;
@property (nonatomic) UIImageView *detailImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.detailScrollView setTranslatesAutoresizingMaskIntoConstraints:YES];
    
    [self showDetails];
    
    
    
}

- (void)showDetails
{
    
//    CGFloat detailScrollWidth = CGRectGetWidth(self.detailScrollView.frame);
//    CGFloat detailScrollHeight = CGRectGetHeight(self.detailScrollView.frame);
//    
//    self.detailImageView.image = self.passedImage;
//    
//    self.detailImageView.frame = CGRectMake(detailScrollWidth, 0, detailScrollWidth, detailScrollHeight);
    
    self.detailImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.detailImageView = [[UIImageView alloc] initWithImage:self.passedImage];
    
    [self.detailScrollView addSubview:self.detailImageView];
    
    self.detailScrollView.contentSize = self.detailImageView.bounds.size;
    
    self.detailScrollView.minimumZoomScale = 0.25;
    self.detailScrollView.maximumZoomScale = 4.0;
    self.detailScrollView.zoomScale = 1.0;
    
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.detailImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

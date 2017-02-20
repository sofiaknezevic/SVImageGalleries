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
    
    self.detailScrollView.minimumZoomScale = 1.0;
    self.detailScrollView.maximumZoomScale = 4.0;
    self.detailScrollView.zoomScale = 1.0;
    
    [self showDetails];
    
    
    
}

- (void)showDetails
{
    self.detailImageView.image = self.image;
    
    self.detailImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.detailScrollView addSubview:self.detailImageView];
    
    self.detailScrollView.contentSize = self.detailImageView.bounds.size;
    
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

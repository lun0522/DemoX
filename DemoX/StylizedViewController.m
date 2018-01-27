//
//  StylizedViewController.m
//  DemoX
//
//  Created by Pujun Lun on 1/26/18.
//  Copyright © 2018 Lun. All rights reserved.
//

#import "StylizedViewController.h"

@interface StylizedViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)tapShare:(id)sender;

@end

@implementation StylizedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView.image = _stylizedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapShare:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Save to album"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                UIImageWriteToSavedPhotosAlbum(_stylizedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
                                            }]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

- (void)image:(UIImage *)image
didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:error? @"Error" : @"Success!"
                                message:error? error.localizedDescription : @"Please view in the album."
                                preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                              style:UIAlertActionStyleCancel
                                            handler:nil]];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

@end

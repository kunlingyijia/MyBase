//
//  ViewController.m
//  拨打电话
//
//  Created by 席亚坤 on 2017/6/5.
//  Copyright © 2017年 席亚坤. All rights reserved.
//

#import "ViewController.h"
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>
#import <CallKit/CXCall.h>
#import <CallKit/CXCallObserver.h>
#import <CallKit/CXProvider.h>



#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<CXProviderDelegate>{
    NSString *filePath;

}
@property(nonatomic,strong) CXCallObserver *CxCallObserver;
@property(nonatomic,strong) CTCallCenter *CtCallCenter;



@property (nonatomic, strong) AVAudioSession *session;


@property (nonatomic, strong) AVAudioRecorder *recorder;//录音器

@property (nonatomic, strong) AVAudioPlayer *player; //播放器
@property (nonatomic, strong) NSURL *recordFileUrl; //文件地址

@end

@implementation ViewController
- (IBAction)XX:(id)sender {
     [self  BeganRecording];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString *version = [UIDevice currentDevice].systemVersion;
    NSCalendar *calendar = nil;
    if (version.doubleValue <= 10.0) { // iOS系统版本 <= 10.0
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else{ //iOS系统版本 > 10.0
        self.CxCallObserver = [[CXCallObserver alloc] init];
        [self.CxCallObserver setDelegate:self queue:dispatch_get_main_queue()];
}
   

    
    }
- (void)providerDidReset:(CXProvider *)provider{
    
}
- (void)callObserver:(CXCallObserver *)callObserver callChanged:(CXCall *)call{
    if (call.isOutgoing) {
        if (call.hasEnded) {
            NSLog(@"电话挂断");
            if (self.recorder) {
//                if ([self.recorder isRecording]) {
//                    [self.recorder stop];
//                    return;
//                }
            }
            return;
            // operation(state: CurrentState.HasEnded)
        }
        if (call.hasConnected) {
            NSLog(@"电话接通");
           // [self BeganRecording];
        
//            operation(state: CurrentState.HasConnected)
        }
        
        if (call.isOnHold ){
            NSLog(@"无人接听挂断");
            //operation(state: CurrentState.IsOnHold)
        }
    } else {
        NSLog(@"other error");
    }

}

#pragma mark - 系统小于或者等于10.0;
-(void)detectCall
{
    self.CtCallCenter = [[CTCallCenter alloc] init];
    self.CtCallCenter.callEventHandler=^(CTCall* call)
    {
        if (call.callState == CTCallStateDisconnected)
        {
            NSLog(@"-----------------------------挂断");   //挂断
            //            self.viewController.signalStatus=YES;
        }
        else if (call.callState == CTCallStateConnected)
        {
            NSLog(@"-----------------------------连通了"); //联通了
        }
        
        else if(call.callState == CTCallStateIncoming)
        {
            NSLog(@"Call is incoming??????????1");
            //self.viewController.signalStatus=NO;
        }
        
        else if (call.callState ==CTCallStateDialing)
        {
            NSLog(@"-----------------------------拨号");  //拨号
        }
        else
        {
            NSLog(@"Nothing is done????????????2");
        }
    };
}


- (IBAction)callAction:(UIButton *)sender {
//    UIWebView *callView = [UIWebView new];
//    NSString *tel = @"telprompt://";
//    NSString * number = [tel stringByAppendingString:@"18317894322"];
//    NSURL * telURL = [NSURL URLWithString: number];
//    [callView loadRequest:[NSURLRequest requestWithURL:telURL]];
//    [self.view addSubview:callView];
    
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"18317894322"];
    //            NSLog(@"str======%@",str);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

//    if ([self.recorder isRecording]) {
//        [self.recorder stop];
//        return;
//    }
    
}


#pragma mark - 开始录音
-(void)BeganRecording{
    AVAudioSession *session =[AVAudioSession sharedInstance];
    NSError *sessionError;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    
    if (session == nil) {
        
        NSLog(@"Error creating session: %@",[sessionError description]);
        
    }else{
        [session setActive:YES error:nil];
        
    }
    
    self.session = session;
    
    
    //1.获取沙盒地址
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
  filePath = [path stringByAppendingString:@"/RRecord.wav"];
    
    //2.获取文件路径
    
    self.recordFileUrl = [NSURL fileURLWithPath:  filePath];
    
    //设置参数
    NSDictionary *recordSetting = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   //采样率  8000/11025/22050/44100/96000（影响音频的质量）
                                   [NSNumber numberWithFloat: 8000.0],AVSampleRateKey,
                                   // 音频格式
                                   [NSNumber numberWithInt: kAudioFormatLinearPCM],AVFormatIDKey,
                                   //采样位数  8、16、24、32 默认为16
                                   [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,
                                   // 音频通道数 1 或 2
                                   [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                                   //录音质量
                                   [NSNumber numberWithInt:AVAudioQualityHigh],AVEncoderAudioQualityKey,
                                   nil];
    
    
    _recorder = [[AVAudioRecorder alloc] initWithURL:self.recordFileUrl settings:recordSetting error:nil];
    
    if (_recorder) {
        
        _recorder.meteringEnabled = YES;
        [_recorder prepareToRecord];
        [_recorder record];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            
//            [self stopRecord:nil];
//        });
        
        
        
    }else{
        NSLog(@"音频格式和文件存储格式不匹配,无法初始化Recorder");
        
    }
    
    
}

- (IBAction)PlayRecord:(id)sender {
    
    NSLog(@"播放录音");
        if ([self.recorder isRecording]) {
            [self.recorder stop];
        }
    
    if ([self.player isPlaying])return;
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recordFileUrl error:nil];
    
    NSLog(@"%li",self.player.data.length/1024);
    
    
    [self.session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [self.player play];
    
    
    
    
}

#pragma mark - dealloc
- (void)dealloc
{
    NSLog(@"%@销毁了", [self class]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

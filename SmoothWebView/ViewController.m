//
//  ViewController.m
//  SmoothWebView
//
//  Created by kaiinui on 2014/10/31.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "ViewController.h"

#import "UIWebView+Smooth.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webView smooth_enableNativeLikeBahavior];
    webView.delegate = self;
    [webView loadHTMLString:@"<!DOCTYPE HTML><html lang=\"en-US\"><head> <meta charset=\"UTF-8\"> <title></title> <style type=\"text/css\"> a{}</style></head><body><br/><br/><br/><a href=\"app://whoa\">ほあ！</a> ほがほが <a href="">ほが！</a>双界の勇者<br />様々な近接武器を使いこなし、重装備による高い防御力を備えた前衛型の最終クラス。多数の武器の選択は悩ましい所だが、<br />火力が欲しければ大剣、間接攻撃ならば槍や刀、回避に特化するなら武具といった選択で適宜選択していこう。<br />ただし、純前衛としてのユニットは非常に多いため、彼らより際立った個性を見せられるかどうかはプレイヤーの運用次第である。<br />越響者(竜の護り手経由)<br />攻撃力の高い大剣、回避力に優れた武具。それに加えて銃が装備可能になるクラス。旧作でドラゴンライダーと呼ばれたクラスの性能を引き継いでいる。<br />前述の武器に加え、高いTEC補正を持つ着物が装備可能になることにより<a href='app://クリティカル'>クリティカル</a>も期待できるようになる。何より、攻撃範囲の広さと｢ダブルアタック｣の相性は抜群。<br />接近してきた相手を近接武器でいなしつつ、後続に銃撃を浴びせかけるという攻撃的な運用はこのクラスならでは。竜使い経由よりも最終MATは上になる。<br />越響者(竜使い経由)<br />大剣と武具が使えなくなるが、代わりに杖とMDFに優れる獣服が装備可能になる。杖はマスター効果で得られる回避ボーナスが高いため、物理型でも俊敏や見切りと併用する場合は便利。<br />また、RATEの関係から大剣と剣･刀の火力にはそこまで開きがないのもポイント。特に本編では剣の方が高性能な場合が多い。しかし一番の利点は召喚ランクが伸びること。<br />憑依召喚に加え、単身でユニット召喚のサポートも受けることができるようになるため、非常に行動の幅が広がるのが利点。竜の護り手経由より最終ATは上になる。<br />双界の賢者<br />純召喚師型クラス。召喚師として必要なスキルは全て揃っており、MAT補正が優秀な射撃武器である投具による間接攻撃も可能。<br />さらに元々の軽装備により他の召喚師タイプよりも防御面で恵まれているのが特徴。獣属性の多彩さと、竜の子達が持つランクアップのサモンアシストを活かしていきたい。<br />特に3からの引継ぎをしている場合、生徒の護衛獣の召喚術はどれも優秀。竜の子との協力召喚で気軽に運用できるため、主人公で召喚術を使う場合は一考の余地あり。</body></html>" baseURL:[NSURL URLWithString:@"http://0.0.0.0:3000/"]];
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([request.URL.absoluteString containsString:@"app://"]) {
        NSLog(@"App Scheme: %@", request.URL);
        NSString *message = [request.URL.absoluteString stringByReplacingOccurrencesOfString:@"app://" withString:@""];
        
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Dialog" message:message preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [controller dismissModalViewControllerAnimated:YES];
        }]];
        [self presentViewController:controller animated:YES completion:NULL];
        
        return NO;
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView smooth_smoothAllForCurrentPage];
}

@end

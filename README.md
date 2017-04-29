## CCPassValueDemo
#### 在iOS开发中，界面间数据传输是最为基本的需求，苹果公司为我们开发中提供了多种传值方式，我们在这谈谈常见的五种方式。
>  1. 属性传值
>  2. 代理传值
>  3. block传值
>  4. 单例传值
>  5. 通知传值
#### 这五种方式各有特点，在不同情况下可以选择使用不同的方式，接下来我们具体说说这五种界面传值方式。
### 一、属性传值
一般来说，从前一个界面往后一个界面传值，属性传值是最简便的一种；比如我们需要将第一个界面中textfield的输入内容传入第二个界面中的lable。我们我们先在第二个界面 即在PropertyControllerB.h文件中设置一个接口，接收由第一个页面传过来的内容。

```
#import <UIKit/UIKit.h>

@interface PropertyControllerB : UIViewController
@property(nonatomic, strong) NSString *str; //传值字符串
@end

```
然后在PropertyControllerB.m文件中创建一个label 用来显示接受到的内容。

```
//创建一个label用来显示接收到的内容
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.3, kCCDeviceHeight*0.3, kCCDeviceWidth*0.4, 50)];
    label.backgroundColor = [UIColor redColor];
    label.text = _str;
    [self.view addSubview:label];

```
接下来，我们就可以在第一个界面PropertyControllerA.m文件中利用属性将textfield的内容传到第二个界面了。

```
#import "PropertyControllerA.h"
#import "PropertyControllerB.h"

#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface PropertyControllerA ()<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *textField;
@end

@implementation PropertyControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"属性传值A";
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.2, kCCDeviceHeight*0.3, kCCDeviceWidth*0.6, 60)];
    self.textField.backgroundColor = [UIColor blueColor];
    self.textField.placeholder = @"请输入....";
    self.textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
}

//实现页面跳转
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     PropertyControllerB *vc = [PropertyControllerB new];
    [self.navigationController pushViewController:vc animated:YES];
    vc.str = self.textField.text;
}
```
这样就成功通过属性的方法传值了。
### 二、代理传值
代理传值也是我们经常使用的一种传值方法，它适用于从第二个界面向第一个界面传值。
比如我们想要DelegateControllerA页面push到DelegateControllerB页面，如果DelegateControllerB页面的信息想回传（回调）到DelegateControllerA页面，用代理传值，其中DelegateControllerB定义协议和声明代理，DelegateControllerA确认并实现代理，DelegateControllerA作为DelegateControllerB的代理值。
- 第一步:我们在第二个界面即DelegateControllerB.h文件中创建协议方法。
```
#import <UIKit/UIKit.h>
//设置代理
@class DelegateControllerB;
@protocol DelegateControllerBDelegate <NSObject>
-(void)pass:(NSString*)str;
@end

@interface DelegateControllerB : UIViewController
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,weak)id <DelegateControllerBDelegate> delegate;//weak防止循环引用
@end

```
- 第二步：在DelegateControllerB.m文件中创建输入框，并实现代理方法

```
#import "DelegateControllerB.h"
#import "DelegateControllerA.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface DelegateControllerB ()

@end

@implementation DelegateControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"代理传值B";
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.2, kCCDeviceHeight*0.3, kCCDeviceWidth*0.6, 60)];
    self.textField.backgroundColor = [UIColor blueColor];
    self.textField.placeholder = @"请输入....";
    self.textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
}

//返回上一级页面
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:YES];
    [_delegate pass:_textField.text];
}
```
- 第三步：在DelegateControllerA.m文件中指定代理并实现代理方法

```
#import "DelegateControllerA.h"
#import "DelegateControllerB.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface DelegateControllerA ()<DelegateControllerBDelegate>
@property(nonatomic, strong) UILabel *label;
@end

@implementation DelegateControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"代理传值A";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.3, kCCDeviceHeight*0.3, kCCDeviceWidth*0.4, 50)];
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btn];
    btn.layer.cornerRadius = 5.0f;
    btn.frame = CGRectMake(kCCDeviceWidth*0.1, kCCDeviceHeight*0.75, kCCDeviceWidth * 0.8,  kCCDeviceHeight * 0.08);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"代理传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click{
    DelegateControllerB *vc = [[DelegateControllerB alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.delegate = self;
}
//实现代理方法
- (void)pass:(NSString *)str{
    _label.text = str;
}
```
这样我们就实现了使用代理方式从后往前进行传值。
### 三、block传值
它同代理传值一样，同样适用于从第二个界面向第一个界面传值。
- 第一步：要在BlockControllerB.h文件中定义并声明block。

```
#import <UIKit/UIKit.h>
//定义有参无返回值的匿名函数(传递字符串)
typedef void (^myBlock)(NSString *);

@interface BlockControllerB : UIViewController
//block 的属性
@property(nonatomic, strong) myBlock block;
@end
```
- 第二步：在BlockControllerB.m文件中进行传值

```
#import "BlockControllerB.h"

#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface BlockControllerB ()
@property(nonatomic,strong)UITextField *textField;
@end

@implementation BlockControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Block传值B";
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.2, kCCDeviceHeight*0.3, kCCDeviceWidth*0.6, 60)];
    self.textField.backgroundColor = [UIColor blueColor];
    self.textField.placeholder = @"请输入....";
    self.textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.block(_textField.text);
    [self.navigationController popViewControllerAnimated:YES];
}
```
- 第三步：在BlockControllerA.m页面接收传递过来的内容

```
#import "BlockControllerA.h"
#import "BlockControllerB.h"

#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface BlockControllerA ()
@property(nonatomic, strong) UILabel *label;
@end

@implementation BlockControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Block传值A";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.3, kCCDeviceHeight*0.3, kCCDeviceWidth*0.4, 50)];
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btn];
    btn.layer.cornerRadius = 5.0f;
    btn.frame = CGRectMake(kCCDeviceWidth*0.1, kCCDeviceHeight*0.75, kCCDeviceWidth * 0.8,  kCCDeviceHeight * 0.08);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"block传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];

}
- (void)click{
    BlockControllerB *vc = [[BlockControllerB alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.block = ^(NSString *string){
        self.label.text = string;
    };
}
```
这样就完成了界面间的值传递。

### 四、单例传值
单例传值可以理解为定义一个全局静态变量进行传值，我们同样使用上面需求，将第二个页面的内容传入第一个页面并显示。
> 注：如何规范的创建一个单例类，大家可以参看这篇文章：https://www.xiyoumobile.com/active_main.html#[wiki108]
- 第一步:定义一个单例类，创建一个对外接口

```
//.h文件
#import <Foundation/Foundation.h>

@interface ValuePass : NSObject
@property(nonatomic,strong)NSString *string;
+(instancetype)sharedHadle;
@end

// .m文件
#import "ValuePass.h"

@implementation ValuePass
//创建单例
static ValuePass *valuePass = nil;
+(instancetype)sharedHadle{
    static dispatch_once_t token;
    //使用dispatch_once一次性代码，整个程序只会执行一次，默认是线程安全的
    dispatch_once(&token, ^{
        
        valuePass = [[ValuePass alloc] init];
        
    });
    return valuePass;
}
@end
```
- 第二步：在第二个页面SIngletonViewControllerB.m文件中创建输入框并在页面跳转时将输入框内容传值

```
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.navigationController popViewControllerAnimated:YES];
    ValuePass *value = [ValuePass sharedHadle];
    value.string = _textField.text;
    NSLog(@"%@",value.string);
}
```

-  第三步：在第一个页面接收并显示内容，这里有一点需要注意从第二个页面传回来的时候,传值有个加载顺序,只能在即将加载中显示

```
- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    ValuePass *value = [ValuePass sharedHadle];
    _label.text = value.string;
}
```
### 五、通知传值
在各控制器之间传值除了代理模式外，通知也是较为快捷，方便的方式之一。
注；有关通知的使用，也有一篇文章可以参考：https://www.xiyoumobile.com/active_main.html#wiki104
- 第一步：我们在第二个页面NotificationControllerB.m创建一个按钮，点击按钮跳转页面并发送通知

```
#import "NotificationControllerB.h"
#define kCCDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kCCDeviceHeight [UIScreen mainScreen].bounds.size.height
@interface NotificationControllerB ()
@property(nonatomic,strong)UITextField *textField;
@end

@implementation NotificationControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通知传值B";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor greenColor];
    button.frame = CGRectMake(kCCDeviceWidth*0.1, kCCDeviceHeight*0.75, kCCDeviceWidth * 0.8,  kCCDeviceHeight * 0.08);
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown ];
    [self.view addSubview:button];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.2, kCCDeviceHeight*0.3, kCCDeviceWidth*0.6, 60)];
    self.textField.backgroundColor = [UIColor blueColor];
    self.textField.placeholder = @"请输入....";
    self.textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
}
- (void)click:(UIButton *)sender{
    
    //创建字典
    NSDictionary *dict = [NSDictionary dictionaryWithObject:self.textField.text forKey:@"key"];
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"volue" object:self userInfo:dict];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
}
```

- 第二步：在第一个页面NotificationControllerA.m添加观察者，用来监听通知事件

```
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通知传值A";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(kCCDeviceWidth*0.3, kCCDeviceHeight*0.3, kCCDeviceWidth*0.4, 50)];
    _label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:btn];
    btn.layer.cornerRadius = 5.0f;
    btn.frame = CGRectMake(kCCDeviceWidth*0.1, kCCDeviceHeight*0.75, kCCDeviceWidth * 0.8,  kCCDeviceHeight * 0.08);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"通知传值" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volue:) name:@"volue" object:nil];
}
- (void)click{
    NotificationControllerB *vc = [[NotificationControllerB alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)volue:(NSNotification *)sender{
    
    self.label.text = sender.userInfo[@"key"];
    NSLog(@"%@",sender.userInfo[@"key"]);
}

```

- 注意：使用完通知一定要记得移除

这就是通知传值

---
其中，除了这五种以外，方法传值也是常用的一种传值方式。

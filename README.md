# LCSideslipViewController

WWSideslipViewController

## How to install and use?


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

//左控制器

LeftViewController *leftvc = [[LeftViewController alloc]init];

//右控制器

RightViewController *rightvc = [[RightViewController alloc]init];

//主控制器

MainViewController *mainvc = [[MainViewController alloc]init];

/**
*  @param leftView    左控制器

*  @param mainView    主控制器

*  @param righView    右控制器

*  @param isSwapeLeft 是否支持向左滑动

*  @param image       背景图片

*/

LCSideslipViewController *sidevc = [[LCSideslipViewController alloc]initWithLeftView:leftvc mainView:mainvc rightView:rightvc isSwapeToLeft:YES backgroundImage:nil];

self.window.rootViewController = sidevc;

[self.window makeKeyAndVisible];

return YES;


}







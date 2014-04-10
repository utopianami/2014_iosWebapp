
#import "AppDelegate.h"

#import "ViewController.h"
#import "TSMiniWebBrowser.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize navigationController = _navigationController;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL wantTabBarDemo = NO;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Tabbar mode demo init code
    if (wantTabBarDemo) {
        UIViewController *dummyViewController = [[UIViewController alloc] init];
        dummyViewController.title = @"Other Controller";
        dummyViewController.tabBarItem.image = [UIImage imageNamed:@"first.png"];
        
        TSMiniWebBrowser *webBrowser = [[TSMiniWebBrowser alloc] initWithUrl:[NSURL URLWithString:@"aphro-zone.heroku.com"]];
        webBrowser.barStyle = UIBarStyleBlack;
        webBrowser.mode = TSMiniWebBrowserModeTabBar;
        webBrowser.title = @"TSMiniWebBrowser";
        webBrowser.tabBarItem.image = [UIImage imageNamed:@"second.png"];
        
        self.tabBarController = [[UITabBarController alloc] init];
        self.tabBarController.viewControllers = [NSArray arrayWithObjects:webBrowser, dummyViewController, nil];
        
        self.window.rootViewController = self.tabBarController;
        
    // navigation and modal mode demo init code
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
        
        self.window.rootViewController = self.navigationController;
    }
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end

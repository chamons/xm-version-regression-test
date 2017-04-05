using AppKit;
using Foundation;

namespace XMRegressionTest
{
	[Register ("AppDelegate")]
	public class AppDelegate : NSApplicationDelegate
	{
		public AppDelegate ()
		{
		}

		public override void DidFinishLaunching (NSNotification notification)
		{
			System.Console.WriteLine ("%REGRESSION_VERSION%");
			NSApplication.SharedApplication.Terminate (this);
		}

		public override void WillTerminate (NSNotification notification)
		{
			// Insert code here to tear down your application
		}
	}
}

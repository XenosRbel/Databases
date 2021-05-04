using Laba_11.Services;
using Laba_11.Views;
using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Laba_11
{
	public partial class App : Application
	{

		public App()
		{
			InitializeComponent();

			DependencyService.Register<MockDataStore>();
			MainPage = new AppShell();
		}

		protected override void OnStart()
		{
		}

		protected override void OnSleep()
		{
		}

		protected override void OnResume()
		{
		}
	}
}

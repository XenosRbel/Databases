using System;
using System.Windows.Input;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Laba_11.ViewModels
{
	public class AdminViewModel : BaseViewModel
	{
		public AdminViewModel()
		{
			Title = "Admin";
			OpenWebCommand = new Command(async () => await Browser.OpenAsync("https://aka.ms/xamarin-quickstart"));
		}

		public ICommand OpenWebCommand { get; }
	}
}
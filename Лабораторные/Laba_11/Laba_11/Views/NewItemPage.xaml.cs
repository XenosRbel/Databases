using Laba_11.Models;
using Laba_11.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Laba_11.Views
{
	public partial class NewItemPage : ContentPage
	{
		public Item Item { get; set; }

		public NewItemPage()
		{
			InitializeComponent();
			BindingContext = new NewItemViewModel();
		}
	}
}
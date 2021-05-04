using Laba_11.ViewModels;
using System.ComponentModel;
using Xamarin.Forms;

namespace Laba_11.Views
{
	public partial class ItemDetailPage : ContentPage
	{
		public ItemDetailPage()
		{
			InitializeComponent();
			BindingContext = new ItemDetailViewModel();
		}
	}
}
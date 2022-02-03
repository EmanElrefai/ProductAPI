# Thirdwayv-iOS-Collection-View-Challenge

In this app: 

- Created a mock API that returns the data that exist in the attached JSON file using Myjson.
- Connected the mock API and displays a list of products.
- The products are displayed in a `UICollectionView` using LazyHGrid in swiftUI .
- When a product is selected, a new product details view should be displayed.
- Applied the concept of cashing. 
- Wrote the unit test cases and genetated the code average.

What makes this app unique? 

- Created it and implemented collection view using swiftUI.  
- Applied animation between product list page and product details page.
- Used combine library 
- Open to anyone to learn the concept of cashing (How make your app interact when internet connection is on or off)

### Which design pattern I used?

The MVVM pattern consists of three layers:
- Model: App data that the app operates on.
- View: The user interface’s visual elements. In iOS, the view controller is inseparable from the concept of the view.
- ViewModel: Updates the model from view inputs and updates views from model outputs.

#### Why?

MVVM offers some advantages over MVC:
- MVVM makes the view controller simpler by moving a lot of business logic out of it.
- The view model better expresses the business logic for the view.
- A view model is much easier to test than a view controller. You end up testing business logic without having to worry about view implementations.

## The App 3 main pages:
[1] Home Product page.

[2] Product Details page.

[3] Error page when there is no internet connection.


## Home Product page
<p align="left">
   <img src="main.png" width="250" height="500">
</p>

## Product Details page
<p align="left">
  <img src="detail.png" width="250" height="500">
</p>

## Error page when there is no internet connection
<p align="left">
  <img src="offline.png" width="250" height="500">
</p>



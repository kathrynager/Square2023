## Build tools & versions used
- XCode 13.4.1
- CocoaPods 1.11.3
- iOS 14.0

## Steps to run the app
1 Install CocoaPods if not already installed:
    sudo gem install cocoapods
2 pod install 
3 open SquareProject2023.xcworkspace
4 Press the Play button to run app

## What areas of the app did you focus on?
1 EmployeeService and EmployeeServiceViewModel integration & testing
2 Structure
3 UI based off iPhone

## What was the reason for your focus? What problems were you trying to solve?
1 EmployeeService/EmployeeServiceViewModel is the main functionality of the app handling the data fetching 
and error handling/logging. I also spent time creating mocks for testing the integration.

I made the EmployeeService a bit generic in case more endpoints needed to be added in the future by
separating out the fetch and decode functions. This also lets the Service be responsible for logging instead of the
view model.

2 I like to get a project well structured in the beginning so it's easy to add on in the future and all files
are well organized.

## How long did you spend on this project?
~5 hrs

## Did you make any trade-offs for this project? What would you have done differently with more time?
I used a 3rd party libraby for caching, but if I had more time I may have considered creating my own cache. 
Or I would have looked more deeply into a few more cache libraries to see if there are better ones or
if creating my own would be better for the long term.

## What do you think is the weakest part of your project?
Spent a lot of time getting the core functionality right for displaying data and testing w/ dependency injection,
so I didn't get to spend as much time on UI as I'd like because I love building UI! As I mostly have been a mobile/FE 
engineer.

## Did you copy any code or dependencies? Please make sure to attribute them here!
- 3rd Party Library Kingfisher - responsible for image caching
- Copied the URLSessionProtocol/URLSessionMock for mocking the URLSession responses

## Is there any other information you’d like us to know?
- Added a xxconfig to store the url to fetch from. Only made one Release config for this project.

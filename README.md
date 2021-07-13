# ViewCodable

ViewCodable is a swift library for build Server Driven UI Components. 
The library was designed to be used on a swift backend and on iOS apps. Since a swift ui view is just a struct, nothing stop was of building a codable view! 
And by taking the power of swift backend frameworks like Smoke Framework, we are able to create a strong contract between frontend and backend, since both iOS apps and swift backend are using the exactly same code we can be sure that we are not going to have broke contracts (if we use the same library version of course), meaning that we can be sure that the view we are building on the backend are going to be rendered on the frontend. 

# iOS
 ### First you need to register the dependencies, ViewCodable requires that you register a service that conforms to the protocol CodableService. You should register it on the initializations of your app. 
 
 ```swift
    DependecyContainer.shared.register(instance: YourService())
 ```

### Second you create  a ServerDrivenStarterView and add it to a UIHostingController.
```swift
    let contentView = ServerDrivenStarterView(destination: "home")
    window.rootViewController = UIHostingController(rootView: contentView)
```

# Sample
Under the folder sample, there is a iOS and a swift backend sample. 

### Server Sample
Just click on run and try to past the URL http://localhost:8080/home on the browser, it should return a json. 


### iOS Sample
After running the swift server, just run the iOS project, the view will be rendered accordingly to the swift server requests. 



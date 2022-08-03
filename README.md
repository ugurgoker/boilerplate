# Boilerplate Project

A boilerplate project created in flutter using Provider.

## Getting Started

The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/ugurgoker/boilerplate.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;.gr.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
**/*.gr.dart
```

## Boilerplate Features:

* Splash
* Login
* Routing
* Theme
* Hive Database
* Utilities file 
* Alert Dialogs
* Provider (State Management)
* Dependency Injection
* Dark Theme Support
* Multilingual Support
* Provider example
* Gitignore

### Up-Coming Features:

* Push Notification Service (required firebase)
* Log Service

### Libraries & Tools Used

* hive
* intl
* provider
* auto_route
* reflectable
* path_provider
* flutter_phoenix
* permission_handler
* dart_json_mapper_flutter
* fluttertoast
* adaptive_dialog
* flutter_svg
* flutter_svg_provider
* cached_network_image
* animate_do
* build_runner
* effective_dart
* auto_route_generator

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- .vscode
|- android
|- assets
|- ios
|- lib
```

Here is the folder structure we have been using in this project

```
lib/
|- core/
|- ui/
```

```
core/
|- constant/
|- enums/
|- extensions/
|- model/
|- resources/
|- services/
|- settings/
|- utils/
```

```
ui/
|- animations/
|- base/
|- bs/
|- fragments/
|- packages/
|- views/
|- vms/
|- vms_fragment/
|- widgets/
```


## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.


# moviedb

https://www.youtube.com/watch?v=CUYZIqHGx5o

<div align="center">
      <a href="https://www.youtube.com/watch?v=CUYZIqHGx5o">
     <img 
      src="https://img.youtube.com/vi/CUYZIqHGx5o/0.jpg" 
      alt="Everything Is AWESOME" 
      style="width:100%;">
      </a>
    </div>

# flutter doctor

      [✓] Flutter (Channel stable, 2.5.0, on macOS 11.5.2 20G95 darwin-x64, locale en-RO)
      [✓] Android toolchain - develop for Android devices (Android SDK version 30.0.3)
      [✓] Xcode - develop for iOS and macOS
      [✓] Chrome - develop for the web
      [✓] Android Studio (version 2020.3)
      [✓] IntelliJ IDEA Community Edition (version 2021.2.1)
      [✓] VS Code (version 1.59.1)
      [✓] Connected device (1 available)
      
# How to run
      1. Download Flutter
      2. Run the command $ flutter doctor
      3. Go the the project main directory and run $ flutter run (make sure to have a device connected)


# Notes

How to Generate BLOC package
Install flutter bloc plugin (Android Studio -> Preferences -> Plugins -> MarketPlace -> search & install flutter bloc (from felangel)
(When creating new BLOC package simply follow these steps:
- Right click -> New -> Bloc Class -> give name of the bloc -> It will automatically generate the bloc, state & event classes)

For widgets, when needing to wrap a widget in a BlocProvider / Consumer:
- option + Enter -> Wrap in Bloc{Widget}

Dependencies needed in order to make the json & api client generation to work:
http: ^latest version
retrofit: ^latest version
dio: ^latest version
json_annotation: ^latest version
built_value: ^latest version

Dev Dependecies
build_runner: ^latest version
built_value_generator: ^latest version
retrofit_generator: ^latest version
json_serializable: ^latest version

For Retrofit
- create APIClient:
    - provide baseURl
    - write GET/POST/PUT etc methods as in documentation (similar to Kotlin / Java)
  
- create models to map API Response

Steps to create Model
Annonate class with @JsonSerializable()
Define model fields (with exact keys from the API Reponse)
Define constructor & serialization methods

Steps to generate Serialization class
Run command flutter pub run build_runner build
Follow terminal instructions (if it's the first time creating the class, it will mention to specify as an import part of {modelName}.g.dart)
If command will run with success it will generate a new serialization dart file in the same package as the model
If there are any modifications added to the model run command flutter pub run build_runner build 

Data Model mentions:
- for the popular movies list all the params were optional (See documentation at https://developers.themoviedb.org/3/movies/get-popular-movies)

#Improvements
- see if there is an annotation for the Data Models keys used for serialization 
  (ex: instead of naming a field original_language, provide an annotation for the key "original_language" and name the field originalLanguage)



# flutter-moviedb

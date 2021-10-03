# moviedb

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
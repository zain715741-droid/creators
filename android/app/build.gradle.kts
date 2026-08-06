plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // Apply the Google services Gradle plugin here
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.creater_project"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.creater_project"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// Place your Firebase dependencies here at the app level
dependencies {
    // // Import the Firebase BoM
    // implementation(platform("com.google.firebase:firebase-bom:34.17.0"))

    // // Add the dependencies for Firebase products you want to use
    // implementation("com.google.firebase:firebase-analytics")
}

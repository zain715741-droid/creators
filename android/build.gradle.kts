// D:\flutter_project\creators\android\build.gradle.kts

plugins {
    // ADD 'apply false' HERE to prevent root execution
    id("com.android.application") apply false 
    id("org.jetbrains.kotlin.android") apply false 
    
    // This line is already correct
    id("com.google.gms.google-services") version "4.4.4" apply false 
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory
    .dir("../../build")
    .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

#!/bin/bash
mkdir java_app
cd java_app
echo 'public class MyApp {
    public static void main(String[] args) {
        System.out.println("Hello from MyApp!");
    }
}' > MyApp.java
javac MyApp.java
echo 'Main-Class: MyApp' > manifest.txt
jar cfm myapp.jar manifest.txt MyApp.class
# Keep Razorpay classes
-keep class com.razorpay.** { *; }

# Keep annotations used by Razorpay SDK
-keep @proguard.annotation.Keep class *
-keep @proguard.annotation.KeepClassMembers class *

# Keep Flutter JNI and other dependencies
-keep class io.flutter.** { *; }
-keep class androidx.** { *; }
-keep class com.google.** { *; }
-keep class org.intellij.lang.annotations.** { *; }

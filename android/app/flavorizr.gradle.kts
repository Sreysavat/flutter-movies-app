import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.sabay.dev"
            resValue(type = "string", name = "app_name", value = "SabayNews-dev")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.sabaynews.app"
            resValue(type = "string", name = "app_name", value = "Sabay-News")
        }
    }
}
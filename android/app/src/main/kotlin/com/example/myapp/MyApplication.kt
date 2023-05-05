package com.example.myapp
import ai.haptik.android.wrapper.sdk.HaptikSDK
import ai.haptik.android.wrapper.sdk.model.InitData
import ai.haptik.android.wrapper.sdk.model.SignupData
import io.flutter.app.FlutterApplication
import org.json.JSONObject

class MyApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        val initData = InitData().apply {
            primaryColor = "#420420"
            composerPlaceholder = "Type message...."
            noHeader = false
            initializeLanguage = "en"
        }
        HaptikSDK.init(applicationContext, initData)
//        HaptikSDK.loadGuestConversation()
    }
    //HaptikSDK.logout(context)
    companion object {

        fun launchGuestConversation() {
            println("called init function");
            HaptikSDK.setLaunchMessage("Your Message", true, true)
            HaptikSDK.loadGuestConversation();
        }
        fun launchCustomSignupConversation() {
            val signupData = SignupData().apply {
                authCode = "5991e770f0f5e7add3ab6194c02e3f3b01af21b4b4b43299a55592a3a417e8f6"
                authId = "2028399250"
                signupType = "third_party"
                customData = JSONObject().apply {
                    put("email", "test@email.com")
                    put("mobile_no", "9898989898")
                    put("username", "User Name")
                }
            }
            HaptikSDK.loadConversation(signupData)
        }
    }



}
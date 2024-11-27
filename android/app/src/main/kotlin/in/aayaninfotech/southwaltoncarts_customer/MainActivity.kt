package `in`.aayaninfotech.southwaltoncarts_customer
import android.net.Uri
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    private val CALL_CHANNEL = "in.aayaninfotech.southwaltoncarts_customer/call"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        setupCallChannel(flutterEngine)


    }


    private fun setupCallChannel(flutterEngine: FlutterEngine) {

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CALL_CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "callNumber") {
                val phoneNumber = call.argument<String>("phoneNumber")
                if (phoneNumber != null) {
                    makePhoneCall(phoneNumber)
                    result.success(null)
                } else {
                    result.error("ERROR", "Phone number not provided", null)
                }
            } else {
                result.notImplemented()
            }
        }

    }

    private fun makePhoneCall(phoneNumber: String) {
        val intent = Intent(Intent.ACTION_DIAL).apply {
            data = Uri.parse("tel:$phoneNumber")
        }
        startActivity(intent)
    }

}

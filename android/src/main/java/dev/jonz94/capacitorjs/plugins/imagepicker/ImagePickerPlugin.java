package dev.jonz94.capacitorjs.plugins.imagepicker;

import android.net.Uri;
import com.getcapacitor.JSObject;
import com.getcapacitor.Logger;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import gun0912.tedimagepicker.builder.TedImagePicker;
import gun0912.tedimagepicker.builder.TedImagePicker.Builder;

@CapacitorPlugin(name = "ImagePicker")
public class ImagePickerPlugin extends Plugin {

    @PluginMethod
    public void present(PluginCall call) {
        Builder builder = TedImagePicker
            .with(getContext())
            .errorListener(error -> {
                Logger.error(error.toString());
            })
            .cancelListener(() -> {
                Logger.info("user cancelled");
            });

        builder.showCameraTile(false);

        builder.start(uri -> {
            JSObject image = new JSObject();
            image.put("path", uri.toString());
            image.put("mimeType", getMimeTypeFromUri(uri));

            JSObject result = new JSObject();
            result.put("image", image);

            call.resolve(result);
        });
    }

    private String getMimeTypeFromUri(Uri uri) {
        if (uri == null) {
            return "";
        }
        return bridge.getContext().getContentResolver().getType(uri);
    }
}

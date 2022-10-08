package dev.jonz94.capacitorjs.plugins.imagepicker;

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

        builder.start(result -> {
            Logger.info(result.toString());
            JSObject ret = new JSObject();
            ret.put("value", result);
            call.resolve(ret);
        });
    }
}

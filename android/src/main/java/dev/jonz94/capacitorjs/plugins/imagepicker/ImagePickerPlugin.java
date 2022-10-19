package dev.jonz94.capacitorjs.plugins.imagepicker;

import android.net.Uri;
import com.getcapacitor.FileUtils;
import com.getcapacitor.JSArray;
import com.getcapacitor.JSObject;
import com.getcapacitor.Logger;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import gun0912.tedimagepicker.builder.TedImagePicker;
import gun0912.tedimagepicker.builder.TedImagePicker.Builder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@CapacitorPlugin(name = "ImagePicker")
public class ImagePickerPlugin extends Plugin {

    @PluginMethod
    public void present(PluginCall call) {
        Integer limit = call.getInt("limit");
        if (limit == null) {
            limit = 1;
        }

        String surpassLimitMessage = call.getString("surpassLimitMessage");
        if (surpassLimitMessage == null) {
            surpassLimitMessage = "You can only select %d image(s)";
        }
        surpassLimitMessage = String.format(surpassLimitMessage, limit);

        String titleText = call.getString("titleText");
        if (titleText == null) {
            titleText = "Select Image";
        }

        String albumAllText = call.getString("albumAllText");
        if (albumAllText == null) {
            albumAllText = "All";
        }

        String doneText = call.getString("doneText");
        if (doneText == null) {
            doneText = "Done";
        }

        Builder builder = TedImagePicker
            .with(getContext())
            .errorListener(error -> {
                Logger.error(error.toString());
            })
            .cancelListener(() -> {
                Logger.info("user cancelled");
            });

        builder.showCameraTile(false);
        builder.title(titleText);
        builder.albumAllText(albumAllText);
        builder.buttonText(doneText);
        builder.max(limit, surpassLimitMessage);

        if (limit == 1) {
            builder.start(uri -> {
                handleResult(Collections.singletonList(uri), call);
            });
        } else {
            builder.startMultiImage(uris -> {
                handleResult(uris, call);
            });
        }
    }

    private void handleResult(List<? extends Uri> uris, PluginCall call) {
        List<JSObject> imageList = new ArrayList<>();
        for (int i = 0; i < uris.size(); i++) {
            Uri uri = uris.get(i);
            JSObject image = new JSObject();
            image.put("path", uri.toString());
            image.put("webPath", FileUtils.getPortablePath(getContext(), bridge.getLocalUrl(), uri));
            image.put("mimeType", getMimeTypeFromUri(uri));
            imageList.add(image);
        }

        JSObject result = new JSObject();
        result.put("images", JSArray.from(imageList.toArray()));

        call.resolve(result);
    }

    private String getMimeTypeFromUri(Uri uri) {
        if (uri == null) {
            return "";
        }
        return bridge.getContext().getContentResolver().getType(uri);
    }
}

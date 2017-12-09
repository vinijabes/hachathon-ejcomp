package com.example.vinicius.hackathon;

import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

import com.facebook.AccessToken;
import com.facebook.AccessTokenSource;
import com.facebook.FacebookRequestError;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;
import com.facebook.HttpMethod;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

public class MandaFace extends AppCompatActivity {

    EditText CampoA, CampoB;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        setContentView(R.layout.activity_manda_face);

        Log.d("TOKEN", AccessToken.getCurrentAccessToken().getToken().toString());
        AccessToken token = new AccessToken("EAAbo8eqw8DUBADqmxCvTZAf5fUWCVqW0EOapNhqexxtg5eSJfyxQaO7A8MPXzKMWSwwtZAlVX6bbc2er5xd0sER7w2br4EO4wopUBAjzxUNrIXZCGhaX4cH1OQrAATTm4vqpfZBzGEJ662hLiY18Ll912YNyMvzBxE6zDu3werldmNPLn0GT3QYOdJbelAIZD",
                AccessToken.getCurrentAccessToken().getUserId(),
                AccessToken.getCurrentAccessToken().getUserId(), Arrays.asList("publish_actions", "manage_pages", "publish_pages"),
                null, AccessTokenSource.FACEBOOK_APPLICATION_SERVICE,
                AccessToken.getCurrentAccessToken().getExpires(), AccessToken.getCurrentAccessToken().getLastRefresh());
        AccessToken.setCurrentAccessToken(token);

        CampoA = (EditText)findViewById(R.id.editText);
        CampoB = (EditText)findViewById(R.id.editText2);
        if(CampoA == null) {
            Log.d("CAMPOS","CAMPO A NULO" );
        }
        if(CampoB == null) {
            Log.d("CAMPOS","CAMPO B NULO" );
        }
    }

    public void EnviaPost(View view){
        AccessToken accessToken = AccessToken.getCurrentAccessToken();
        AssetManager assets = getAssets();
        String teste = "" + R.drawable.imagem1;
        Log.d("DRAWABLELOG", teste);

        Resources res = getResources();
        Bitmap bitmap = BitmapFactory.decodeResource(res, R.drawable.imagem1);
        byte[] data;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, baos);
        data = overlay();
        Log.d("IMAGEM", data.toString());
        //OutputStream imagem = new FileOutputStream(R.drawable.imagem1);
        Bundle postParams = new Bundle();
        postParams.putString("name", CampoA.getText().toString());
        postParams.putString("caption", "Hackathon");
        postParams.putString("description", CampoA.getText().toString());
        postParams.putString("message", CampoB.getText().toString());
        //postParams.putString("link", "yourLink");
        postParams.putByteArray("photo", data);
        //postParams.putByteArray("photo", getImageAsData());
        GraphRequest request = new GraphRequest(accessToken, "1917406141844758/photos",
                postParams, HttpMethod.POST, null);

        GraphResponse response = request.executeAndWait();//or executeAsync() see documentation
        Log.d("RESULTREQUEST",response.toString());

        FacebookRequestError error = response.getError();
        if (error != null) {
            Log.d("POST_ERROR", error.toString());
            return;
        }
    }

    public byte[] getImageAsData() {
        Drawable d = getResources().getDrawable(R.drawable.imagem2);
        Bitmap bitmap = ((BitmapDrawable) d).getBitmap();
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream);
        byte[] bitmapdata = stream.toByteArray();
        return bitmapdata;
    }

    public byte[] overlay() {
        Drawable d1 = getResources().getDrawable(R.drawable.imagem1);
        Drawable d2 = getResources().getDrawable(R.drawable.imagem2);
        Bitmap bmp1 = ((BitmapDrawable) d1).getBitmap();
        Bitmap bmp2 = ((BitmapDrawable) d2).getBitmap();
        bmp2 = getScaledBitmap(bmp2, 512,512);
        Bitmap bmOverlay = Bitmap.createBitmap(bmp1.getWidth(), bmp1.getHeight(), bmp1.getConfig());
        Canvas canvas = new Canvas(bmOverlay);
        canvas.drawBitmap(bmp1, new Matrix(), null);
        canvas.drawBitmap(bmp2, 0, 0, null);
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bmOverlay.compress(Bitmap.CompressFormat.JPEG, 100, stream);
        byte[] bitmapdata = stream.toByteArray();
        return bitmapdata;
    }

    public static Bitmap getScaledBitmap(Bitmap b, int reqWidth, int reqHeight)
    {
        int bWidth = b.getWidth();
        int bHeight = b.getHeight();

        int nWidth = reqWidth;
        int nHeight = reqHeight;

        float parentRatio = (float) reqHeight / reqWidth;

        nHeight = bHeight;
        nWidth = (int) (reqWidth * parentRatio);
        Matrix m = new Matrix();

        m.setRectToRect(new RectF(0, 0, b.getWidth(), b.getHeight()), new RectF(0, 0, reqWidth, reqHeight), Matrix.ScaleToFit.CENTER);
        return Bitmap.createBitmap(b, 0, 0, b.getWidth(), b.getHeight(), m, true);
    }
}

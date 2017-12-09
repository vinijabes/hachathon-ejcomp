package com.example.vinicius.hackathon;

import android.content.Intent;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.facebook.AccessToken;
import com.facebook.AccessTokenSource;
import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookException;
import com.facebook.FacebookRequestError;
import com.facebook.FacebookSdk;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;
import com.facebook.HttpMethod;
import com.facebook.appevents.AppEventsLogger;
import com.facebook.login.LoginManager;
import com.facebook.login.LoginResult;
import com.facebook.login.widget.LoginButton;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Arrays;

public class MainActivity extends AppCompatActivity {

    //@Override
    //protected void onCreate(Bundle savedInstanceState) {
        //super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);
    //}
    private CallbackManager callbackManager;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        setContentView(R.layout.activity_main);
        //initialize Facebook SDK
        FacebookSdk.sdkInitialize(getApplicationContext());
        AppEventsLogger.activateApp(this);

        LoginButton loginButton = (LoginButton) findViewById(R.id.login_button);
        //loginButton.setReadPermissions(Arrays.asList("manage_pages", "publish_pages"));
        if(!isLoggedIn()) {
            loginFacebook();
        }else{
        }
        Log.d("PERMISSOES", AccessToken.getCurrentAccessToken().getPermissions().toString());
        //NovaActivity();

        loginButton.registerCallback(callbackManager, new FacebookCallback<LoginResult>() {
            @Override
            public void onSuccess(LoginResult loginResult) {
                GraphRequest request = GraphRequest.newMeRequest(loginResult.getAccessToken(), new GraphRequest.GraphJSONObjectCallback() {
                    @Override
                    public void onCompleted(JSONObject object, GraphResponse response) {

                        try {
                            String name = object.getString("name");
                            String email = object.getString("email");
                            Toast.makeText(getApplicationContext(), "Name: " + name + " Email: " + email, Toast.LENGTH_LONG).show();
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                });

                Bundle parameters = new Bundle();
                parameters.putString("fields", "id,name,email,gender, birthday");
                request.setParameters(parameters);
                request.executeAsync();

                Log.d("BRABRA", "BRABRABRA");
                //PEGA O TOKEN DO SITE CORRESPONDENTE
                AccessToken accessToken = AccessToken.getCurrentAccessToken();
                String token = AccessToken.getCurrentAccessToken().getToken().toString();
                Bundle getParams = new Bundle();
                getParams.putString("access_token", token);
                GraphRequest requestSiteToken = new GraphRequest(accessToken, "me/accounts",
                        getParams, HttpMethod.GET, null);

                GraphResponse response = request.executeAndWait();//or executeAsync() see documentation
                Log.d("RESULTREQUESTSITE",response.toString());

                FacebookRequestError error = response.getError();
                if (error != null) {
                    Log.d("POST_ERROR", error.toString());
                    return;
                }

                /*AccessToken tokenURL = new AccessToken("EAAbo8eqw8DUBADqmxCvTZAf5fUWCVqW0EOapNhqexxtg5eSJfyxQaO7A8MPXzKMWSwwtZAlVX6bbc2er5xd0sER7w2br4EO4wopUBAjzxUNrIXZCGhaX4cH1OQrAATTm4vqpfZBzGEJ662hLiY18Ll912YNyMvzBxE6zDu3werldmNPLn0GT3QYOdJbelAIZD",
                        AccessToken.getCurrentAccessToken().getUserId(),
                        AccessToken.getCurrentAccessToken().getUserId(), Arrays.asList("publish_actions", "manage_pages", "publish_pages"),
                        null, AccessTokenSource.FACEBOOK_APPLICATION_SERVICE,
                        AccessToken.getCurrentAccessToken().getExpires(), AccessToken.getCurrentAccessToken().getLastRefresh());
                AccessToken.setCurrentAccessToken(tokenURL);*/
            }

            @Override
            public void onCancel() {
                Log.d("TAG", "onCancel");
            }

            @Override
            public void onError(FacebookException error) {
                Log.d("TAG", "onError");
            }
        });

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        callbackManager.onActivityResult(requestCode, resultCode, data);
    }

    public void NovaActivity(){
        Intent postaFace = new Intent(this, MandaFace.class);
        startActivity(postaFace);
    }
    public boolean isLoggedIn() {
        AccessToken accessToken = AccessToken.getCurrentAccessToken();
        return accessToken != null;
    }

    public void loginFacebook(){
        LoginManager.getInstance().logInWithPublishPermissions(
                this,
                Arrays.asList("publish_actions", "manage_pages", "publish_pages", "pages_show_list"));
        callbackManager = CallbackManager.Factory.create();
    }
}

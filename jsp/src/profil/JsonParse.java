package profil;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class JsonParse {


    private Kisi kisi;


    public Kisi getJson() {
        HttpURLConnection connection = null;
        String urllink = "https://randomuser.me/api";
        String output = "";
        try {
            URL url = new URL(urllink);
            connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Content-Type", "application/json");
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    (connection.getInputStream()), "UTF-8"));
            output = br.readLine();


            JSONObject jsonObject = new JSONObject(output);
            JSONArray results =jsonObject.getJSONArray("results");
            JSONObject jsonObject1 = results.getJSONObject(0);
            String nat = jsonObject1.getString("nat");
            JSONObject name =jsonObject1.getJSONObject("name");

            String gender =jsonObject1.getString("gender");


            JSONObject location = jsonObject1.getJSONObject("location");

            String email = jsonObject1.getString("email");

            JSONObject login = jsonObject1.getJSONObject("login");

            JSONObject dob = jsonObject1.getJSONObject("dob");
            JSONObject registered = jsonObject1.getJSONObject("registered");
            String phone = jsonObject1.getString("phone");

            String cell = jsonObject1.getString("cell");


            JSONObject picture = (JSONObject) jsonObject1.get("picture");




            kisi = new Kisi(gender, name, location, email, login, dob, registered, phone, cell, picture, nat);


        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
        return kisi;
    }
}



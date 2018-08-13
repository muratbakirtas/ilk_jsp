<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="profil.JsonParse" %>
<%@ page import="profil.Kisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>json</title>

    <style>
        body {font-family: Arial;
        }
        .tab {
            position: relative;

            background-color: #f1f1f1;
            margin-left: 40%;


        }
        .tab button {
            background-color: deepskyblue;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }
        .tab button:hover {
            background-color: darkblue;
        }
        .tab button.active {
            background-color: red;
            color: yellow;
        }
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }
        p {
            color: #ff01f4;
            background-color: snow;
            border-style: groove;
            border-width: 5px;
            border-radius: 2px;
            text-align: center;
            width: 50%;
            margin-left: 25%;
            height: 25px ;

        }
        b{color: orangered;
        }
    </style>
</head>
<body>

<center>
<img width="200px" height="200px" src="<%
    JsonParse pars = new JsonParse();
    Kisi kisi=pars.getJson();
    out.println(kisi.getPicture().getString("large"));
%>" alt="Resim"/>
</center>
<p><b>Title: </b> <%out.println( kisi.getName().getString("title"));%></p>
<p><b>Fist name:</b> <% out.println( kisi.getName().getString("first"));%></p>
<p><b>Last name:</b> <%out.println(kisi.getName().getString("last"));%></p>
<p><b>Gender:</b> <%out.println(kisi.getGender());%></p>
<p><b>Nationality:</b> <% out.println(kisi.getNat()); %></p>




<div class="tab">
    <button class="tablinks" onclick="openCity(event, 'Address')">Address</button>
    <button class="tablinks" onclick="openCity(event, 'Login')">Login</button>
    <button class="tablinks" onclick="openCity(event, 'Date')">Date</button>
    <button class="tablinks" onclick="openCity(event, 'Contact')">Contact</button>
</div>


<div id="Address" class="tabcontent">
    <br>
    <br>
    <br>
    <p><b>Address:</b> <%out.println(kisi.getLocation().getString("street")+" "+
            kisi.getLocation().getString("city")+" "+
            kisi.getLocation().getString("state"));%></p>

    <p><b>Postcode:</b> <% String postcode;
        int postcode2;
        try {postcode2 = (kisi.getLocation().getInt("postcode"));
        out.println( postcode2 );} catch (Exception e){postcode = kisi.getLocation().getString("postcode");
        out.println( postcode );}
        out.println( );%></p>

    <p><b> Coordinates:</b>
        <%out.println("' "+kisi.getLocation().getJSONObject("coordinates").getString("latitude")+" / "+kisi.getLocation().getJSONObject("coordinates").getString("longitude")+" '");%></p>
    <p><b>Timezone:</b> <% out.println(kisi.getLocation().getJSONObject("timezone").getString("description") +"-GMT"+kisi.getLocation().getJSONObject("timezone").getString("offset")); %> </p>

</div>

<div id="Contact" class="tabcontent">
    <br>
    <br>
    <br>
    <p><b>Email:</b> <% out.println(kisi.getEmail()); %> </p>
    <p><b>Phone: </b><% out.println(kisi.getPhone()); %></p>
    <p><b>Cell: </b><% out.println(kisi.getCell()); %></p>
</div>
<div id="Login" class="tabcontent">
    <br>
    <br>
    <br>
    <p><b>Login id: </b><% out.println(kisi.getLogin().getString("uuid")); %></p>
    <p><b>Login username: </b><% out.println(kisi.getLogin().getString("username")); %></p>
    <p><b>Login password: </b><% out.println(kisi.getLogin().getString("password")); %></p>

    <p><b>Password salt: </b><% out.println(kisi.getLogin().getString("salt")); %></p>
    <p><b>Password md5: </b><% out.println(kisi.getLogin().getString("md5")); %></p>
    <p><b>Password sha1: </b><% out.println(kisi.getLogin().getString("sha1")); %></p>
    <p><b>Password sha256: </b><% out.println(kisi.getLogin().getString("sha256")); %></p>
</div>

<div id="Date" class="tabcontent">
    <br>
    <br>
    <br>
    <p><b>Birthday date: </b><% out.println(kisi.getDob().getString("date")); %></p>
    <p><b>Age: </b><% out.println(kisi.getDob().getInt("age")); %></p>
    <p><b>Register date: </b><% out.println(kisi.getRegistered().getString("date")); %></p>
    <p><b>Register age: </b><% out.println(kisi.getRegistered().getInt("age")); %></p>
</div>


<script>
    function openCity(evt, Adress) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(Adress).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>






</body>
</html>


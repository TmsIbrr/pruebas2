<html>
    <head>
        <title>Login</title>
    </head>
    <style>

        table{

            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-size: 1vw;
            
        }

    </style>
    <%
        if trim(Request("Ingresar"))="Ingresar" then

           Rut =trim(Request("Rut"))
           Clave =trim(Request("Clave"))

           Rut = replace(Rut,".","")
           Rut = replace(Rut,"-","")

            if len(Rut)=9 then
                Rut = "0"&Rut      
            end if

            if len(Rut)=8 then
                Rut = "00"&Rut      
            end if

            RutVerdadero="0123456789"
            ClaveVerdadera="duoc24"



                    if (Clave = ClaveVerdadera) and (Rut = RutVerdadero) then

                        Session("RUT")=Rut
                        
                        response.redirect("index.asp")

                    else%>
                    <script>alert("Datos incorrectos")</script>
                    <%end if



        end if
    %>
    <body bgcolor="green" topmargin="0">
        <table style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 10%"></td>
                <td>
                    <table style="width: 100%; height: 100%; background-color: aliceblue;">
                        <tr>
                            <td align="center">
                                <form name="form" action="login.asp" method="post">
                                    <table>
                                        <tr>
                                            <td colspan="2"><h1>Bienvenido</h1></td>
                                        </tr>
                                        <tr>
                                            <td>Rut:</td>
                                            <td><input type="text" name="Rut" required maxlength="12" value="<%=trim(Request("Rut"))%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Clave:</td>
                                            <td><input type="password" name="Clave" required maxlength="6" value="<%=trim(Request("Clave"))%>"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center"><input type="submit" value="Ingresar" name="Ingresar"></td>
                                        </tr>
                                    </table>
                                </form>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 10%"></td>
            </tr>
        </table>
    </body>
</html>
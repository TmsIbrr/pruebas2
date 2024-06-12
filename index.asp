<!-- #include file="conexion.asp"-->
<html>
    <head>
        <title>Sitio de Prueba</title>
        <meta charset="UTF-8">
        <style>

            table{

                font-family: Verdana, Geneva, Tahoma, sans-serif;
                font-size: 1vw;
                background-color: aliceblue;
            }

        </style>
    </head>
    <form name="limpiavariables" action="index.asp" method="post">
    </form>
    <form name="irapostulaciones" action="postulaciones.asp" method="post">
    </form>
    <%

      
    if trim(Request("Enviar"))="Enviar" then

        Rut = trim(Request("Rut"))
        Nombres = trim(Request("Nombres"))
        ApPaterno = trim(Request("ApPaterno"))
        ApMaterno = trim(Request("ApMaterno"))
        Fnacimiento = trim(Request("Fnacimiento"))
        Telefono = trim(Request("Telefono"))
        Movil = trim(Request("Movil"))
        Correo=trim(Request("Correo"))
        Carreras = trim(Request("Carreras"))
        Observaciones = trim(Request("Observaciones"))
        Medio1 = trim(Request("Medio1"))
        Medio2 = trim(Request("Medio2"))
        
           Rut = replace(Rut,".","")
           Rut = replace(Rut,"-","")

            if len(Rut)=9 then
                Rut = "0"&Rut      
            end if

            if len(Rut)=8 then
                Rut = "00"&Rut      
            end if
        
        'VALIDA POSTULACIÓN

        Set ValidaPostulacion=Conn.execute("SELECT * FROM Postulaciones where Rut='"&Rut&"'")
        
            if not ValidaPostulacion.eof then%>
                <script>alert("Ud ya está postulando")</script>
            <%Else

             'INSERTO EL REGISTRO EN LA TABLA Postulaciones

             Set InsertaRegistro=Conn.execute("INSERT INTO Postulaciones (Rut,Nombres,ApPaterno,ApMaterno,FechaNacimiento,Correo,Telefono,Movil,Carrera,Comentarios,Medio1,Medio2) VALUES ('"&Rut&"','"&Nombres&"','"&ApPaterno&"','"&ApMaterno&"','"&Fnacimiento&"','"&Correo&"','"&Telefono&"','"&Movil&"','"&Carreras&"','"&Observaciones&"','"&Medio1&"','"&Medio2&"') ")%>
                <script>alert("Postulación realizada")</script>
            <%end if
    end if
    
    if Session("RUT")<>False then
    %>
    <body bgcolor="green" topmargin="0">
        <form name="form" action="index.asp" method="post">
        <table align="center" cellspacing="5" style="width: 80%; height: 100%;">
            <tr>
                <td colspan="2">Bienvenido: <%=Session("NOMBRE")%></td>
                <td colspan="2" align="right"><input type="button" value="Ver Postulaciones" name="Lista Postulaciones" onclick="irapostulaciones.submit()"></td>
            </tr>
            <tr>
                <td colspan="4" align="center"><strong>Formulario de Ingreso Alumnos</strong></td>
            </tr>
            <tr>
                <td>Rut:</td>
                <td colspan="3"><input type="text" name="Rut" id="Rut" style="width: 100%;" required value="<%=Request("Rut")%>"></td>
            </tr>
            <tr>
                <td>Nombres:</td>
                <td colspan="3"><input type="text" name="Nombres" id="Nombres" style="width: 100%;" required value="<%=Request("Nombres")%>"></td>
            </tr>
            <tr>
                <td>Ap. Paterno:</td>
                <td><input type="text" name="ApPaterno" id="ApPaterno" required value="<%=Request("ApPaterno")%>"></td>
                <td>Ap. Materno:</td>
                <td><input type="text" name="ApMaterno" id="ApMaterno" required value="<%=Request("ApMaterno")%>"></td>
            </tr>
            <tr>
                <td>Fecha de Nacimiento:</td>
                <td colspan="3"><input type="date" name="Fnacimiento" id="Fnacimiento" style="width: 100%;" required value="<%=Request("Fnacimiento")%>"></td>
            </tr>
            <tr>
                <td>Teléfono:</td>
                <td><input type="number" name="Telefono" id="Telefono" required value="<%=Request("Telefono")%>"></td>
                <td>Móvil:</td>
                <td><input type="number" name="Movil" id="Movil" placeholder="(+56 9) xxxxx" required value="<%=Request("Movil")%>"></td>
            </tr>
            <tr>
                <td>Correo:</td>
                <td colspan="3"><input type="email" name="Correo" id="Correo" style="width: 100%;" required value="<%=Request("Correo")%>"></td>
            </tr>
            <tr>
                <td>Carrera:</td>
                <td colspan="3"><select name="Carreras" style="width: 100%;">
                    <%Set Carreras=Conn.execute("SELECT * FROM Carreras order by NombreCarrera")

                    while not Carreras.eof%>    
                    <option value="<%=Carreras("Id")%>"><%=Carreras("NombreCarrera")%></option>
                    <%Carreras.movenext
                    wend%>
                </select></td>
            </tr>
            <tr>
                <td valign="top">Si tienes alguna duda, favor escríbela aquí:</td>
                <td colspan="3" valign="top"><textarea name="Observaciones" id="Observaciones" rows="10" style="resize: none; width: 100%;"><%=Request("Observaciones")%></textarea></td>
            </tr>
            <tr>
                <td>¿Cómo quieres que te contactemos?</td>
                <td>
                    <table>
                        <tr>
                            <td><input type="checkbox" name="Medio1" id="Medio1" required <%if trim(Request("Medio1"))="on" then%>checked<%end if%>></td>
                            <td>Correo</td>
                            <td><input type="checkbox" name="Medio2" id="Medio2" required <%if trim(Request("Medio2"))="on" then%>checked<%end if%>></td>
                            <td>Vía Telefónica</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center"><input type="submit" name="Enviar" value="Enviar">&nbsp;<input type="button" value="Limpiar" name="Limpiar" onclick="limpiavariables.submit();"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
<%
else%>
<script>alert("Debe ingresar nuevamente al sistema")</script>
<%
response.Redirect("login.asp")
end if%>
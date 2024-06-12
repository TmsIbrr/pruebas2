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
    <%
    if Session("RUT")<>False then
    %>
    <body bgcolor="green" topmargin="0">
        <form name="form" action="index.asp" method="post">
        <table align="center" cellspacing="5" style="width: 80%; height: 100%; border-collapse:collapse" border="1">
            <tr>
                <td colspan="8">Bienvenido: <%=Session("NOMBRE")%></td>
            </tr>
            <tr>
                <td colspan="8" align="center"><strong>Postulaciones al <%=now%></strong></td>
            </tr>
            <tr>
                <td><strong>N</strong></td>
                <td><strong>Rut</strong></td>
                <td><strong>Paterno</strong></td>
                <td><strong>Materno</strong></td>
                <td><strong>Carrera</strong></td>
                <td><strong>Correo</strong></td>
                <td><strong>Medio Contacto Correo</strong></td>
                <td><strong>Medio Contacto Teléfono</strong></td>
            </tr>
            <%
                Set Datos=Conn.execute("SELECT Postulaciones.*,Carreras.* FROM Postulaciones,Carreras where Carreras.Id=Postulaciones.Carrera order by Postulaciones.ApPaterno")

                while not Datos.eof

                contador=contador+1
            %>
            <tr>
                <td><%=contador%></td>
                <td><%=trim(Datos("Rut"))%></td>
                <td><%=trim(Datos("ApPaterno"))%></td>
                <td><%=trim(Datos("ApMaterno"))%></td>  
                <td><%=trim(Datos("NombreCarrera"))%></td>  
                <td><%=trim(Datos("Correo"))%></td>
                <td align="center"><%if trim(Datos("Medio1"))="on" then
                            response.Write("Si")
                        Else
                            response.Write("No")
                        end if%></td>
                <td align="center"><%if trim(Datos("Medio2"))="on" then
                            response.Write("Si")
                        Else
                            response.Write("No")
                        end if%></td>
            </tr>
            <%
                Datos.movenext
                wend
            %>
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
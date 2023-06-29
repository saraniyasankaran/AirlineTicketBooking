
<% String id=request.getParameter("id");%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete</title
    </head>
    <body>
        <a href="yes.jsp?id=<%=id%>"><input type="submit" value="Yes" name="yes"></a>
        <a href="AdminEdit.jsp"><input type="submit" value="No" name="no"></a>
    </body>
</html>

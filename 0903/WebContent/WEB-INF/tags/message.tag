<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="font-size" %>
<%@ attribute name="color" %>

<%-- <span><font font-size="${size}" color="${color}"><jsp:doBody /></font></span> --%>
<span style="font-size:${font-size}; color:${color};"><jsp:doBody /></span>
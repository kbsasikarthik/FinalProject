<%@page import="org.hibernate.criterion.Restrictions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="co.grandcircus.FinalProject.entity.Incident"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>


<%

 SessionFactory factory = new Configuration().configure().buildSessionFactory();
int pageIndex = 0;
int totalNumberOfRecords = 0;
int numberOfRecordsPerPage = 4;

String sPageIndex = request.getParameter("pageIndex");

if(sPageIndex ==null)
{
pageIndex = 1;
}else
{
pageIndex = Integer.parseInt(sPageIndex);
}

Session ses = factory.openSession();
int s = (pageIndex*numberOfRecordsPerPage) - numberOfRecordsPerPage;

Criteria crit = ses.createCriteria(Incident.class);
LogicalExpression andExp = Restrictions.and(salary, name);
cr.add( andExp );

Criterion state=Restrictions.ilike("state", "${state}");

crit.setFirstResult(s);
crit.setMaxResults(numberOfRecordsPerPage);

List l = crit.list();
Iterator it = l.iterator();

out.println("<table border=1>");
out.println("<tr>");
out.println("<th>IncidentID</th><th>Date</th><th>State</th>");
out.println("</tr>");

while(it.hasNext())
{
Incident p = (Incident)it.next();
out.println("<tr>");
out.println("<td>"+p.getIncidentId()+"</td>");
out.println("<td>"+p.getDate()+"</td>");
out.println("<td>"+p.getState()+"</td>");
out.println("</tr>");
}

out.println("<table>");

Criteria crit1 = ses.createCriteria(Incident.class);
crit1.setProjection(Projections.rowCount());

List l1=crit1.list();



Iterator it1 = l1.iterator();

if(it1.hasNext())
{
Object o=it1.next();
totalNumberOfRecords = Integer.parseInt(o.toString());
}

int noOfPages = totalNumberOfRecords/numberOfRecordsPerPage;
if(totalNumberOfRecords > (noOfPages * numberOfRecordsPerPage))
{
noOfPages = noOfPages + 1;
}

for(int i=1;i<=noOfPages;i++)
{
String myurl = "success.jsp?pageIndex="+i;
out.println("<a href="+myurl+">"+i+"</a>");
}

%>
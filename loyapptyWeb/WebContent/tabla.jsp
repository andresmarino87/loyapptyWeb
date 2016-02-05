<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
    <head>
        <title>Grid selection</title>
<script type="text/javascript">

 var _gaq = _gaq || [];
 _gaq.push(['_setAccount', 'UA-29036687-1']);
 _gaq.push(['_trackPageview']);

 (function() {
 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 })();

 </script> 
    </head>
    <body> 
            <div id="grid" style="margin:0 auto;"></div>
            <script>
                var dateRegExp = /^\/Date\((.*?)\)\/$/;

                function toDate(value) {
                    var date = dateRegExp.exec(value);
                    return new Date(parseInt(date[1]));
                }

                $(document).ready(function() {
                    $("#grid").kendoGrid({
                        dataSource: {
                            type: "odata",
                            transport: {
                                read: "http://services.odata.org/Northwind/Northwind.svc/Orders"
                            },
                            schema: {
                                model: {
                                    fields: {
                                        OrderID: { type: "number" },
                                        Freight: { type: "number" },
                                        ShipName: { type: "string" },
                                        OrderDate: { type: "date" },
                                        ShipCity: { type: "string" }
                                    }
                                }
                            },
                            pageSize: 10,
                            serverPaging: true,
                            serverSorting: true
                        },
                        selectable: "multiple",
                        sortable: true,
                        pageable: true,
                        navigatable: true,
                        columns: [{
                                field:"OrderID",
                                filterable: false
                            },
                            "Freight", {
                                field: "OrderDate",
                                template: '#= kendo.toString(toDate(OrderDate), "MM/dd/yyyy")#'
                            },
                            "ShipName",
                            "ShipCity"
                        ]
                    });
                });
            </script>

              </body>
</html>
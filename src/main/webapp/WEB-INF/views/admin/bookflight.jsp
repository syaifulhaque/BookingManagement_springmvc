<#include "header.jsp"/> 
<#include "sidebar.jsp" />
<div id="main-content">
    <!-- Main Content Section with everything -->
 
    <h2>Book Flight</h2>
    <form method="post" modelAttribute="bookFlight" enctype="multipart/form-data"
          action="<@spring.url '/index/bookflight'/>">
        <input type="hidden" name="flightId" id="flightId" value="${flight.flightId!}"/>
        <table style="width: 60%">
            <tr>
                <td>Flight Name </td>
                <td>
                    <p name="flightName" >${flight.flightName!}</p></td>
            </tr>

            <tr>
                <td>Flight Source </td>
                <td>
                    <p name="source" >${flight.source!}</p></td>
            </tr>
            <tr>
                <td>Flight Destination </td>
                <td>
                    <p name="destination" >${flight.destination!}</p></td>
            </tr>
            <tr>
                <td>Flight Class </td>
                <td>
                    <p name="flightClass" >${flight.flightClass!}</p></td>
            </tr>
            <tr>
                <td>Flight Charges </td>
                <td>
                    <p name="flightCharge" >${flight.flightCharges!}</p></td>
            </tr>
            <tr>
                <td>Seats Available </td>
                <td>
                    <p name="seats" >${flight.seats!}</p></td>
            </tr>

            <tr>
                <td>Departure Time </td>
                <td>
                    <p name="departureTime" >${flight.departureTime!}</p></td>
            </tr>
            <tr>
                <td>Arrival Time </td>
                <td>
                    <p name="arrival.time" >${flight.arrivalTime!}</p></td>
            </tr>
            <tr>
                <td>Customer Name </td>
                <td>
                    <input type="input" name="custName" /></td>
            </tr>
            <tr>
                <td>Seats Taken </td>
                <td>
                    <select name="totalSeats" style="width: 100px;">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="book"
                                       value="Book This Flight"></td>
            </tr>
        </table>
    </form>

    <div class="clear"></div>
    <!-- End .clear -->
    <#include "header.jsp"/>